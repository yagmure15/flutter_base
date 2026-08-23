import 'package:flutter_base_core/flutter_base_core.dart';
import 'package:injectable/injectable.dart';

import '../entities/{{name.snakeCase()}}.dart';
import '../repositories/{{name.snakeCase()}}_repository.dart';

@lazySingleton
class Get{{name.pascalCase()}} {
  Get{{name.pascalCase()}}(this._repository);

  final {{name.pascalCase()}}Repository _repository;

  Future<Result<{{name.pascalCase()}}>> call() {
    return _repository.get{{name.pascalCase()}}();
  }
}
