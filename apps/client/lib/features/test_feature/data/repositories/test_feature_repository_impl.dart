import 'package:dartz/dartz.dart';
import 'package:flutter_base_core/core.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/test_feature.dart';
import '../../domain/repositories/test_feature_repository.dart';
import '../datasources/test_feature_remote_datasource.dart';

@LazySingleton(as: TestFeatureRepository)
class TestFeatureRepositoryImpl implements TestFeatureRepository {
  TestFeatureRepositoryImpl(this._remoteDataSource);

  final TestFeatureRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, TestFeature>> getTestFeature() async {
    try {
      final result = await _remoteDataSource.getTestFeature();
      return Right(result);
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }
}
