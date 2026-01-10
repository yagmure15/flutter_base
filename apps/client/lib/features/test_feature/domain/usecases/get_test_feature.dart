import 'package:dartz/dartz.dart';
import 'package:flutter_base_core/core.dart';
import 'package:injectable/injectable.dart';
import '../entities/test_feature.dart';
import '../repositories/test_feature_repository.dart';

@lazySingleton
class GetTestFeature {
  GetTestFeature(this._repository);

  final TestFeatureRepository _repository;

  Future<Either<Failure, TestFeature>> call() {
    return _repository.getTestFeature();
  }
}
