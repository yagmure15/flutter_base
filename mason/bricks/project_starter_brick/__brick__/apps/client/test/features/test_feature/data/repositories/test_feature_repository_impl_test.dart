import 'package:{{name.snakeCase()}}/features/test_feature/data/datasources/test_feature_remote_datasource.dart';
import 'package:{{name.snakeCase()}}/features/test_feature/data/models/test_feature_model.dart';
import 'package:{{name.snakeCase()}}/features/test_feature/data/repositories/test_feature_repository_impl.dart';
import 'package:{{name.snakeCase()}}/features/test_feature/domain/entities/test_feature.dart';
import 'package:{{name.snakeCase()}}_core/{{name.snakeCase()}}_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTestFeatureRemoteDataSource extends Mock
    implements TestFeatureRemoteDataSource {}

void main() {
  late MockTestFeatureRemoteDataSource dataSource;
  late TestFeatureRepositoryImpl repository;

  setUp(() {
    dataSource = MockTestFeatureRemoteDataSource();
    repository = TestFeatureRepositoryImpl(dataSource);
  });

  group('TestFeatureRepositoryImpl.getTestFeature', () {
    test('maps the model to a domain entity on success', () async {
      when(() => dataSource.getTestFeature())
          .thenAnswer((_) async => const TestFeatureModel(id: '42'));

      final result = await repository.getTestFeature();

      expect(result, const Success(TestFeature(id: '42')));
    });

    test('converts data source exceptions into failures', () async {
      when(() => dataSource.getTestFeature())
          .thenThrow(const ServerException(message: 'down', code: 503));

      final result = await repository.getTestFeature();

      expect(
        result,
        const FailureResult<TestFeature>(Failure.server('down', 503)),
      );
    });
  });
}
