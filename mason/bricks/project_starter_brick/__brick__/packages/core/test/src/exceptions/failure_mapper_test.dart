import 'package:dio/dio.dart';
import 'package:{{name.snakeCase()}}_core/{{name.snakeCase()}}_core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final options = RequestOptions(path: '/users');

  DioException badResponse(int status, dynamic data) => DioException(
    requestOptions: options,
    type: DioExceptionType.badResponse,
    response: Response(requestOptions: options, statusCode: status, data: data),
  );

  group('failureFromException', () {
    test('returns failures untouched', () {
      const failure = Failure.notFound('gone');
      expect(failureFromException(failure), same(failure));
    });

    test('maps timeouts and connection problems to Failure.network', () {
      for (final type in [
        DioExceptionType.connectionTimeout,
        DioExceptionType.sendTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.connectionError,
        DioExceptionType.badCertificate,
      ]) {
        final failure = failureFromException(
          DioException(requestOptions: options, type: type),
        );
        expect(failure, isA<NetworkFailure>(), reason: '$type');
      }
    });

    test('maps cancellation to Failure.canceled', () {
      final failure = failureFromException(
        DioException(requestOptions: options, type: DioExceptionType.cancel),
      );
      expect(failure, isA<CanceledFailure>());
    });

    test('maps status codes to the matching failure', () {
      expect(
        failureFromException(badResponse(401, null)),
        isA<UnauthorizedFailure>(),
      );
      expect(
        failureFromException(badResponse(403, null)),
        isA<ForbiddenFailure>(),
      );
      expect(
        failureFromException(badResponse(404, null)),
        isA<NotFoundFailure>(),
      );
      expect(
        failureFromException(badResponse(503, null)),
        const Failure.server('Request failed', 503),
      );
    });

    test('extracts message and field errors from validation payloads', () {
      final failure = failureFromException(
        badResponse(422, {
          'message': 'Invalid input',
          'errors': {
            'email': ['must be valid'],
          },
        }),
      );

      expect(
        failure,
        const Failure.validation('Invalid input', {
          'email': ['must be valid'],
        }),
      );
    });

    test('reads the message from common payload keys', () {
      expect(
        failureFromException(badResponse(500, {'error': 'boom'})).message,
        'boom',
      );
      expect(
        failureFromException(badResponse(500, 'plain text')).message,
        'plain text',
      );
    });

    test('maps AppException subclasses', () {
      expect(
        failureFromException(const ServerException(message: 'down', code: 502)),
        const Failure.server('down', 502),
      );
      expect(
        failureFromException(const CacheException(message: 'miss', code: 1)),
        const Failure.cache('miss', 1),
      );
      expect(
        failureFromException(const AuthTokenException(message: 'expired')),
        const Failure.unauthorized('expired'),
      );
      expect(
        failureFromException(const JsonFormatException(message: 'bad json')),
        isA<UnknownFailure>().having((f) => f.message, 'message', 'bad json'),
      );
    });

    test('falls back to Failure.unknown keeping the original error', () {
      final error = StateError('oops');
      final failure = failureFromException(error);

      expect(
        failure,
        isA<UnknownFailure>().having((f) => f.error, 'error', same(error)),
      );
    });
  });
}
