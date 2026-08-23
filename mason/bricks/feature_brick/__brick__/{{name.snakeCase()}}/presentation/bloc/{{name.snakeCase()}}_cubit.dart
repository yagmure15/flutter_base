import 'package:flutter_base_core/flutter_base_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/{{name.snakeCase()}}.dart';
import '../../domain/usecases/get_{{name.snakeCase()}}.dart';

part '{{name.snakeCase()}}_cubit.freezed.dart';
part '{{name.snakeCase()}}_state.dart';

@injectable
class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  {{name.pascalCase()}}Cubit(this._get{{name.pascalCase()}})
    : super(const {{name.pascalCase()}}State.initial());

  final Get{{name.pascalCase()}} _get{{name.pascalCase()}};

  Future<void> started() async {
    emit(const {{name.pascalCase()}}State.loading());
    final result = await _get{{name.pascalCase()}}();
    switch (result) {
      case Success(:final data):
        emit({{name.pascalCase()}}State.success(data));
      case FailureResult(:final failure):
        emit({{name.pascalCase()}}State.error(failure));
    }
  }
}
