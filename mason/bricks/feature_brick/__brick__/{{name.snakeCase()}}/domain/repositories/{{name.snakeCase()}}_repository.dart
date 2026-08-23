import 'package:flutter_base_core/flutter_base_core.dart';

import '../entities/{{name.snakeCase()}}.dart';

abstract class {{name.pascalCase()}}Repository {
  Future<Result<{{name.pascalCase()}}>> get{{name.pascalCase()}}();
}
