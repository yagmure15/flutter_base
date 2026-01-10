import 'package:dartz/dartz.dart';
import 'package:flutter_base_core/core.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/{{name.snakeCase()}}.dart';
import '../../domain/repositories/{{name.snakeCase()}}_repository.dart';
import '../datasources/{{name.snakeCase()}}_remote_datasource.dart';

@LazySingleton(as: {{name.pascalCase()}}Repository)
class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {
  {{name.pascalCase()}}RepositoryImpl(this._remoteDataSource);

  final {{name.pascalCase()}}RemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, {{name.pascalCase()}}>> get{{name.pascalCase()}}() async {
    try {
      final result = await _remoteDataSource.get{{name.pascalCase()}}();
      return Right(result);
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }
}
