import 'package:injectable/injectable.dart';

import 'src/network/interfaces/token_storage.dart';

export 'src/exceptions/exceptions.dart';
export 'src/exceptions/failure.dart';
// Form Inputs
export 'src/form_inputs/email_input.dart';
export 'src/form_inputs/password_input.dart';
export 'src/form_inputs/required_text_input.dart';
export 'src/logger/log_it.dart';
export 'src/monitoring/app_bloc_observer.dart';
export 'src/monitoring/monitoring_service.dart';
export 'src/network/client/api_client.dart';
export 'src/network/interceptors/auth_interceptor.dart';
export 'src/network/interfaces/token_storage.dart';
export 'src/network/mixins/network_handler_mixin.dart';
export 'src/network/models/data_result.dart';
export 'src/network/models/network_failure.dart';
// Services
export 'src/services/connectivity_service.dart';
export 'src/services/permission_service.dart';
// Storage
export 'src/storage/key_value_storage.dart';

/// Marks this package as an injectable micro package.
///
/// Generates `{{name.snakeCase()}}_core.module.dart` (`{{name.pascalCase()}}CorePackageModule`),
/// which apps include via `@InjectableInit(externalPackageModulesBefore: ...)`.
/// [TokenStorage] is implemented by the app, hence ignored here.
@InjectableInit.microPackage(ignoreUnregisteredTypes: [TokenStorage])
void initMicroPackage() {}
