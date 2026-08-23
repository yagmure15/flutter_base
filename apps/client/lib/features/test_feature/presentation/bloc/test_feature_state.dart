part of 'test_feature_cubit.dart';

@freezed
sealed class TestFeatureState with _$TestFeatureState {
  const factory TestFeatureState.initial() = _Initial;
  const factory TestFeatureState.loading() = _Loading;
  const factory TestFeatureState.success(TestFeature data) = _Success;

  /// Keeps the [Failure] itself so the UI can react to specific cases
  /// (e.g. redirect on [UnauthorizedFailure]) and localize the message.
  const factory TestFeatureState.error(Failure failure) = _Error;
}
