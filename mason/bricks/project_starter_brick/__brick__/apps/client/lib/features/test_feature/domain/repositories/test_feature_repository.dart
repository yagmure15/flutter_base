import 'package:dartz/dartz.dart';
import 'package:{{name.snakeCase()}}_core/{{name.snakeCase()}}_core.dart';

import '../entities/test_feature.dart';

abstract class TestFeatureRepository {
  Future<Either<Failure, TestFeature>> getTestFeature();
}
