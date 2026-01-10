part of '{{name.snakeCase()}}_cubit.dart';

@freezed
class {{name.pascalCase()}}State with _${{name.pascalCase()}}State {
  const factory {{name.pascalCase()}}State.initial() = _Initial;
  const factory {{name.pascalCase()}}State.loading() = _Loading;
  const factory {{name.pascalCase()}}State.success({{name.pascalCase()}} data) = _Success;
  const factory {{name.pascalCase()}}State.error(String message) = _Error;
}
