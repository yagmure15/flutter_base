part of '{{name.snakeCase()}}_cubit.dart';

@freezed
sealed class {{name.pascalCase()}}State with _${{name.pascalCase()}}State {
  const factory {{name.pascalCase()}}State.initial() = _Initial;
  const factory {{name.pascalCase()}}State.loading() = _Loading;
  const factory {{name.pascalCase()}}State.success({{name.pascalCase()}} data) = _Success;

  /// Keeps the [Failure] itself so the UI can react to specific cases
  /// (e.g. redirect on [UnauthorizedFailure]) and localize the message.
  const factory {{name.pascalCase()}}State.error(Failure failure) = _Error;
}
