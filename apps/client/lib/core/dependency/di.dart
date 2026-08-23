import 'package:flutter_base_core/flutter_base_core.module.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

/// Configures the service locator.
///
/// Registrations from `flutter_base_core` (network, storage, monitoring, ...)
/// are pulled in through its injectable micro package so the app only has to
/// provide what the core cannot know about: `TokenStorage` and the
/// `@Named('baseUrl')` string (see `app_module.dart`).
@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
  externalPackageModulesBefore: [ExternalModule(FlutterBaseCorePackageModule)],
)
Future<void> configureDependencies({required String environment}) async {
  await getIt.init(environment: environment);
}
