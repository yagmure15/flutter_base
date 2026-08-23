part of 'test_feature_cubit.dart';

@freezed
sealed class TestFeatureState with _$TestFeatureState {
  const factory TestFeatureState.initial() = _Initial;
  const factory TestFeatureState.loading() = _Loading;
  const factory TestFeatureState.success(TestFeature data) = _Success;
  const factory TestFeatureState.error(String message) = _Error;
}
