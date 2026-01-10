// ignore_for_file: invalid_override

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/test_feature.dart';

part 'test_feature_model.freezed.dart';
part 'test_feature_model.g.dart';

@freezed
class TestFeatureModel extends TestFeature with _$TestFeatureModel {
  const factory TestFeatureModel({
    required String id,
  }) = _TestFeatureModel;

  factory TestFeatureModel.fromJson(Map<String, dynamic> json) =>
      _$TestFeatureModelFromJson(json);
}
