import 'package:flutter_base_core/flutter_base_core.dart';

import '../entities/test_feature.dart';

abstract class TestFeatureRepository {
  Future<Result<TestFeature>> getTestFeature();
}
