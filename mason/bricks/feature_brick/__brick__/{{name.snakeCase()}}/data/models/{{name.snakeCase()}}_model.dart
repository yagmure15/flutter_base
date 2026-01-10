// ignore_for_file: invalid_override

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/{{name.snakeCase()}}.dart';

part '{{name.snakeCase()}}_model.freezed.dart';
part '{{name.snakeCase()}}_model.g.dart';

@freezed
class {{name.pascalCase()}}Model extends {{name.pascalCase()}} with _${{name.pascalCase()}}Model {
  const factory {{name.pascalCase()}}Model({
    required String id,
  }) = _{{name.pascalCase()}}Model;

  factory {{name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) =>
      _${{name.pascalCase()}}ModelFromJson(json);
}
