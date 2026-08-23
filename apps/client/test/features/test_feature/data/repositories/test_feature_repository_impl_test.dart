import 'package:flutter_base/features/test_feature/data/datasources/test_feature_remote_datasource.dart';
import 'package:flutter_base/features/test_feature/data/models/test_feature_model.dart';
import 'package:flutter_base/features/test_feature/data/repositories/test_feature_repository_impl.dart';
import 'package:flutter_base/features/test_feature/domain/entities/test_feature.dart';
import 'package:flutter_base_core/flutter_base_core.dart';
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

      expect(result.isRight(), isTrue);
      result.fold(
        (failure) => fail('Expected Right, got $failure'),
        (entity) => expect(entity, const TestFeature(id: '42')),
      );
    });

    test('returns a server failure when the data source throws', () async {
      when(() => dataSource.getTestFeature())
          .thenThrow(const ServerException(message: 'down', code: 503));

      final result = await repository.getTestFeature();

      expect(result.isLeft(), isTrue);
      result.fold(
        (failure) => expect(
          failure.maybeWhen(server: (_, _) => true, orElse: () => false),
          isTrue,
        ),
        (entity) => fail('Expected Left, got $entity'),
      );
    });
  });
}
