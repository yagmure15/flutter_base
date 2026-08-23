import 'package:flutter_base_core/flutter_base_core.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/{{name.snakeCase()}}.dart';
import '../../domain/repositories/{{name.snakeCase()}}_repository.dart';
import '../datasources/{{name.snakeCase()}}_remote_datasource.dart';

@LazySingleton(as: {{name.pascalCase()}}Repository)
class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {
  {{name.pascalCase()}}RepositoryImpl(this._remoteDataSource);

  final {{name.pascalCase()}}RemoteDataSource _remoteDataSource;

  @override
  Future<Result<{{name.pascalCase()}}>> get{{name.pascalCase()}}() async {
    // Result.guard converts anything thrown by the data source (Dio errors,
    // AppExceptions, parsing errors) into a Failure.
    final result = await Result.guard(_remoteDataSource.get{{name.pascalCase()}});
    return result.map((model) => model.toEntity());
  }
}
