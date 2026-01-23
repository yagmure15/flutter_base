import 'package:dio/dio.dart';

import '../models/data_result.dart';
import '../models/network_failure.dart';

/// A mixin that provides a standardized way to handle API calls.
///
/// **Purpose:**
/// This mixin abstracts the repetitive `try-catch` blocks and `DioException` handling
/// logic from your Repositories. It ensures that all API calls return a consistent [DataResult].
///
/// **Usage:**
/// Mix this into your Datasource or Repository implementation.
///
/// **Example:**
/// ```dart
/// class MyRepository with NetworkHandlerMixin {
///   Future<DataResult<User>> getUser() {
///     return handleApiCall<UserDto, User>(
///       call: () => _api.getUser(),
///       mapper: (dto) => dto.toDomain(),
///     );
///   }
/// }
/// ```
mixin NetworkHandlerMixin {
  /// Executes an API call and maps the response to a Domain Entity.
  ///
  /// [call]: A function that returns a Future of the raw data (usually from Dio).
  /// [mapper]: A function that converts the raw data [T] into a Domain Entity [R].
  Future<DataResult<R>> handleApiCall<T, R>({
    required Future<T> Function() call,
    required R Function(T data) mapper,
  }) async {
    try {
      final response = await call();
      return Success(mapper(response));
    } on DioException catch (e) {
      return FailureResult(_mapDioExceptionToFailure(e));
    } catch (e) {
      return FailureResult(NetworkFailure.unknown(e.toString()));
    }
  }

  NetworkFailure _mapDioExceptionToFailure(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkFailure.networkConnection('Connection timed out');
      case DioExceptionType.badResponse:
        return _mapBadResponse(e.response);
      case DioExceptionType.cancel:
        return const NetworkFailure.canceled();
      default:
        return const NetworkFailure.unknown(
          'An unknown network error occurred',
        );
    }
  }

  NetworkFailure _mapBadResponse(Response<dynamic>? response) {
    final statusCode = response?.statusCode;
    final data = response?.data;
    var message = 'Server error';

    if (data is Map<String, dynamic>) {
      // Customize this based on backend error format
      message = (data['message'] as String?) ?? (data['error'] as String?) ?? message;
    }

    if (statusCode == 401) {
      return NetworkFailure.unauthorized(message);
    } else if (statusCode == 404) {
      return NetworkFailure.notFound(message);
    } else if (statusCode != null && statusCode >= 500) {
      return NetworkFailure.serverError(message);
    }

    return NetworkFailure.unknown(message);
  }
}
