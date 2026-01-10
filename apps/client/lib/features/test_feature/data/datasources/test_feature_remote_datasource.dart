import 'package:injectable/injectable.dart';

import '../models/test_feature_model.dart';

abstract class TestFeatureRemoteDataSource {
  Future<TestFeatureModel> getTestFeature();
}

@LazySingleton(as: TestFeatureRemoteDataSource)
class TestFeatureRemoteDataSourceImpl implements TestFeatureRemoteDataSource {
  @override
  Future<TestFeatureModel> getTestFeature() async {
    return const TestFeatureModel(id: '1');
  }
}
