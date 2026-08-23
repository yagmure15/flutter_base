import 'package:injectable/injectable.dart';
import '../models/{{name.snakeCase()}}_model.dart';

abstract class {{name.pascalCase()}}RemoteDataSource {
  Future<{{name.pascalCase()}}Model> get{{name.pascalCase()}}();
}

@LazySingleton(as: {{name.pascalCase()}}RemoteDataSource)
class {{name.pascalCase()}}RemoteDataSourceImpl implements {{name.pascalCase()}}RemoteDataSource {
  @override
  Future<{{name.pascalCase()}}Model> get{{name.pascalCase()}}() async {
    // TODO(developer): Implement the API call.
    return const {{name.pascalCase()}}Model(id: '1');
  }
}
