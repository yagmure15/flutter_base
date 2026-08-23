import 'package:{{name.snakeCase()}}_core/{{name.snakeCase()}}_core.module.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

/// Configures the service locator.
///
/// Registrations from `{{name.snakeCase()}}_core` (network, storage, monitoring, ...)
/// are pulled in through its injectable micro package so the app only has to
/// provide what the core cannot know about: `TokenStorage` and the
/// `@Named('baseUrl')` string (see `app_module.dart`).
@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
  externalPackageModulesBefore: [ExternalModule({{name.pascalCase()}}CorePackageModule)],
)
Future<void> configureDependencies({required String environment}) async {
  await getIt.init(environment: environment);
}
