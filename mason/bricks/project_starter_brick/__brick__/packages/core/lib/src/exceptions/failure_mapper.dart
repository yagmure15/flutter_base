import 'package:dio/dio.dart';

import 'exceptions.dart';
import 'failure.dart';

/// Converts anything thrown in the data layer into a [Failure].
///
/// This is the single place that knows about transport details (Dio status
/// codes, error payload shapes) and about the [AppException] hierarchy.
/// Customize `_messageFromPayload` / `_errorsFromPayload` to match your API.
Failure failureFromException(Object error) {
  return switch (error) {
    Failure() => error,
    DioException() => _fromDioException(error),
    ServerException(:final message, :final code) => Failure.server(
      message,
      code,
    ),
    CacheException(:final message, :final code) => Failure.cache(message, code),
    AuthTokenException(:final message) => Failure.unauthorized(message),
    AppException(:final message) => Failure.unknown(message, error),
    _ => Failure.unknown(error.toString(), error),
  };
}

Failure _fromDioException(DioException exception) {
  switch (exception.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.transformTimeout:
      return const Failure.network('Connection timed out');
    case DioExceptionType.connectionError:
      return const Failure.network('Could not connect to the server');
    case DioExceptionType.badCertificate:
      return const Failure.network('Invalid server certificate');
    case DioExceptionType.cancel:
      return const Failure.canceled();
    case DioExceptionType.badResponse:
      return _fromResponse(exception.response);
    case DioExceptionType.unknown:
      return Failure.unknown(
        exception.message ?? 'Unexpected network error',
        exception.error ?? exception,
      );
  }
}

Failure _fromResponse(Response<dynamic>? response) {
  final statusCode = response?.statusCode;
  final payload = response?.data;
  final message = _messageFromPayload(payload) ?? 'Request failed';

  return switch (statusCode) {
    400 || 422 => Failure.validation(message, _errorsFromPayload(payload)),
    401 => Failure.unauthorized(message),
    403 => Failure.forbidden(message),
    404 => Failure.notFound(message),
    _ => Failure.server(message, statusCode),
  };
}

/// Reads a human readable message from common API error payload shapes.
String? _messageFromPayload(dynamic payload) {
  if (payload is String && payload.trim().isNotEmpty) return payload;
  if (payload is Map<String, dynamic>) {
    for (final key in const ['message', 'error', 'detail']) {
      final value = payload[key];
      if (value is String && value.trim().isNotEmpty) return value;
    }
  }
  return null;
}

/// Reads field-level validation errors (`{"errors": {"email": [...]}}`).
Map<String, dynamic>? _errorsFromPayload(dynamic payload) {
  if (payload is Map<String, dynamic>) {
    final errors = payload['errors'];
    if (errors is Map<String, dynamic>) return errors;
  }
  return null;
}
