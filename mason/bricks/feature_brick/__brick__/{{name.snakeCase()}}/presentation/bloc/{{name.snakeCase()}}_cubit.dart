import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/{{name.snakeCase()}}.dart';
import '../../domain/usecases/get_{{name.snakeCase()}}.dart';

part '{{name.snakeCase()}}_state.dart';
part '{{name.snakeCase()}}_cubit.freezed.dart';

@injectable
class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  {{name.pascalCase()}}Cubit(this._get{{name.pascalCase()}}) : super(const {{name.pascalCase()}}State.initial());

  final Get{{name.pascalCase()}} _get{{name.pascalCase()}};

  Future<void> started() async {
    emit(const {{name.pascalCase()}}State.loading());
    final result = await _get{{name.pascalCase()}}();
    result.fold(
      (failure) => emit({{name.pascalCase()}}State.error(failure.toString())),
      (data) => emit({{name.pascalCase()}}State.success(data)),
    );
  }
}
