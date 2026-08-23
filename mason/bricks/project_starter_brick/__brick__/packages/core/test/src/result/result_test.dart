import 'package:{{name.snakeCase()}}_core/{{name.snakeCase()}}_core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Result', () {
    const success = Result<int>.success(1);
    const failure = Result<int>.failure(Failure.network('offline'));

    test('exposes success and failure state', () {
      expect(success.isSuccess, isTrue);
      expect(success.dataOrNull, 1);
      expect(success.failureOrNull, isNull);

      expect(failure.isFailure, isTrue);
      expect(failure.dataOrNull, isNull);
      expect(failure.failureOrNull, const Failure.network('offline'));
    });

    test('fold reduces both cases', () {
      String describe(Result<int> result) => result.fold(
        onFailure: (f) => 'failure:${f.message}',
        onSuccess: (d) => 'success:$d',
      );

      expect(describe(success), 'success:1');
      expect(describe(failure), 'failure:offline');
    });

    test('map and flatMap transform success values only', () {
      expect(success.map((d) => d * 2), const Success(2));
      expect(failure.map((d) => d * 2), failure);

      expect(
        success.flatMap((d) => Result<String>.success('$d!')),
        const Success('1!'),
      );
      expect(
        success.flatMap(
          (_) => const Result<String>.failure(Failure.cache('x')),
        ),
        const FailureResult<String>(Failure.cache('x')),
      );
    });

    test('values are comparable', () {
      expect(const Success(1), const Success(1));
      expect(const Success(1), isNot(const Success(2)));
      expect(
        const FailureResult<int>(Failure.notFound('a')),
        const FailureResult<int>(Failure.notFound('a')),
      );
    });

    group('guard', () {
      test('wraps the returned value in Success', () async {
        final result = await Result.guard(() async => 'ok');
        expect(result, const Success('ok'));
      });

      test('converts thrown errors through failureFromException', () async {
        final result = await Result.guard<String>(
          () async => throw const ServerException(message: 'down', code: 500),
        );
        expect(
          result,
          const FailureResult<String>(Failure.server('down', 500)),
        );
      });

      test('classifies unexpected errors as Failure.unknown', () async {
        final result = await Result.guard<String>(
          () async => throw StateError('bug'),
        );
        expect(result.failureOrNull, isA<UnknownFailure>());
      });
    });
  });
}
