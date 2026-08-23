import 'package:{{name.snakeCase()}}_core/{{name.snakeCase()}}_core.dart';
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
    test('Failure.server holds correct data', () {
      const Failure.server('Server Failure', 404).when(
        server: (msg, code) {
          expect(msg, 'Server Failure');
          expect(code, 404);
        },
        cache: (_, _) => fail('Should be server'),
        network: (_) => fail('Should be server'),
        unauthorized: (_) => fail('Should be server'),
        notFound: (_) => fail('Should be server'),
        validation: (_, _) => fail('Should be server'),
        unknown: (_, _) => fail('Should be server'),
      );
    });

    test('Failure.network holds correct data', () {
      const failure = Failure.network('No Connection');
      expect(failure, isA<Failure>());
      expect(
        failure.maybeWhen(network: (msg) => msg, orElse: () => null),
        'No Connection',
      );
    });
  });
}
