import 'package:dartz/dartz.dart';
import 'package:flutter_base_core/flutter_base_core.dart';
import '../entities/{{name.snakeCase()}}.dart';

abstract class {{name.pascalCase()}}Repository {
  Future<Either<Failure, {{name.pascalCase()}}>> get{{name.pascalCase()}}();
}
