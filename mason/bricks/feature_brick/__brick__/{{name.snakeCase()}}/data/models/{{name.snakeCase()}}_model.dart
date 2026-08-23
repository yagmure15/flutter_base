import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/{{name.snakeCase()}}.dart';

part '{{name.snakeCase()}}_model.freezed.dart';
part '{{name.snakeCase()}}_model.g.dart';

/// Data-layer representation (DTO) of [{{name.pascalCase()}}].
///
/// Freezed 3+ no longer supports extending a Freezed class from another
/// library, so the model is mapped to the domain entity via [toEntity].
@freezed
abstract class {{name.pascalCase()}}Model with _${{name.pascalCase()}}Model {
  const factory {{name.pascalCase()}}Model({
    required String id,
  }) = _{{name.pascalCase()}}Model;

  const {{name.pascalCase()}}Model._();

  factory {{name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) =>
      _${{name.pascalCase()}}ModelFromJson(json);

  /// Maps this DTO to its domain entity.
  {{name.pascalCase()}} toEntity() => {{name.pascalCase()}}(id: id);
}
