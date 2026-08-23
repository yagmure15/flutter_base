import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/test_feature.dart';

part 'test_feature_model.freezed.dart';
part 'test_feature_model.g.dart';

/// Data-layer representation (DTO) of [TestFeature].
///
/// Freezed 3+ no longer supports extending a Freezed class from another
/// library, so the model is mapped to the domain entity via [toEntity].
@freezed
abstract class TestFeatureModel with _$TestFeatureModel {
  const factory TestFeatureModel({required String id}) = _TestFeatureModel;

  const TestFeatureModel._();

  factory TestFeatureModel.fromJson(Map<String, dynamic> json) =>
      _$TestFeatureModelFromJson(json);

  /// Maps this DTO to its domain entity.
  TestFeature toEntity() => TestFeature(id: id);
}
