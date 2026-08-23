import 'package:flutter_base_core/flutter_base_core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppException', () {
    test('ServerException has correct message and code', () {
      const exception = ServerException(message: 'Server Error', code: 500);
      expect(exception.message, 'Server Error');
      expect(exception.code, 500);
      expect(exception, isA<AppException>());
    });

    test('CacheException has correct message and code', () {
      const exception = CacheException(message: 'Cache Error', code: 100);
      expect(exception.message, 'Cache Error');
      expect(exception.code, 100);
      expect(exception, isA<AppException>());
    });
  });

  group('Failure', () {
    test('union cases are public and pattern matchable', () {
      // Typed as the union so the switch exercises exhaustiveness over Failure.
      // ignore: omit_local_variable_types
      const Failure failure = Failure.server('Server Failure', 404);

      final description = switch (failure) {
        ServerFailure(:final message, :final code) => '$message/$code',
        _ => fail('Should be server'),
      };

      expect(description, 'Server Failure/404');
      expect(failure, const ServerFailure('Server Failure', 404));
    });

    test('message is available on every case', () {
      expect(const Failure.network('No Connection').message, 'No Connection');
      expect(const Failure.canceled().message, 'Request was canceled');
      expect(
        const Failure.validation('Invalid', {'email': 'x'}).message,
        'Invalid',
      );
    });
  });
}
