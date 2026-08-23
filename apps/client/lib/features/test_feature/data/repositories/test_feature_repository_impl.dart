import 'package:flutter_base_core/flutter_base_core.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/test_feature.dart';
import '../../domain/repositories/test_feature_repository.dart';
import '../datasources/test_feature_remote_datasource.dart';

@LazySingleton(as: TestFeatureRepository)
class TestFeatureRepositoryImpl implements TestFeatureRepository {
  TestFeatureRepositoryImpl(this._remoteDataSource);

  final TestFeatureRemoteDataSource _remoteDataSource;

  @override
  Future<Result<TestFeature>> getTestFeature() async {
    // Result.guard converts anything thrown by the data source (Dio errors,
    // AppExceptions, parsing errors) into a Failure.
    final result = await Result.guard(_remoteDataSource.getTestFeature);
    return result.map((model) => model.toEntity());
  }
}
