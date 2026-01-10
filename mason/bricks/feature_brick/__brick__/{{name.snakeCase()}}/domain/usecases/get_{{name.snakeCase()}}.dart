import 'package:dartz/dartz.dart';
import 'package:flutter_base_core/core.dart';
import 'package:injectable/injectable.dart';
import '../entities/{{name.snakeCase()}}.dart';
import '../repositories/{{name.snakeCase()}}_repository.dart';

@lazySingleton
class Get{{name.pascalCase()}} {
  Get{{name.pascalCase()}}(this._repository);

  final {{name.pascalCase()}}Repository _repository;

  Future<Either<Failure, {{name.pascalCase()}}>> call() {
    return _repository.get{{name.pascalCase()}}();
  }
}
