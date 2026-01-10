import 'package:dartz/dartz.dart';
import 'package:flutter_base_core/flutter_base_core.dart';
import '../entities/test_feature.dart';

abstract class TestFeatureRepository {
  Future<Either<Failure, TestFeature>> getTestFeature();
}
