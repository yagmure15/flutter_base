import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_feature.freezed.dart';

@freezed
class TestFeature with _$TestFeature {
  const factory TestFeature({
    required String id,
  }) = _TestFeature;

  const TestFeature._();
}
