// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:dio/dio.dart' as _i361;
import 'package:{{name.snakeCase()}}_core/src/di/core_module.dart' as _i291;
import 'package:{{name.snakeCase()}}_core/src/di/network_module.dart' as _i951;
import 'package:{{name.snakeCase()}}_core/src/monitoring/monitoring_service.dart'
    as _i541;
import 'package:{{name.snakeCase()}}_core/src/network/client/api_client.dart' as _i454;
import 'package:{{name.snakeCase()}}_core/src/network/interceptors/auth_interceptor.dart'
    as _i445;
import 'package:{{name.snakeCase()}}_core/src/network/interfaces/token_storage.dart'
    as _i754;
import 'package:{{name.snakeCase()}}_core/src/services/connectivity_service.dart'
    as _i147;
import 'package:{{name.snakeCase()}}_core/src/services/permission_service.dart'
    as _i738;
import 'package:{{name.snakeCase()}}_core/src/storage/key_value_storage.dart' as _i11;
import 'package:injectable/injectable.dart' as _i526;

class {{name.pascalCase()}}CorePackageModule extends _i526.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) async {
    final coreModule = _$CoreModule();
    final networkModule = _$NetworkModule();
    await gh.singletonAsync<_i11.KeyValueStorage>(
      () => coreModule.keyValueStorage(),
      preResolve: true,
    );
    gh.lazySingleton<_i541.MonitoringService>(
      () => coreModule.monitoringService(),
    );
    gh.lazySingleton<_i147.ConnectivityService>(
      () => coreModule.connectivityService(),
    );
    gh.lazySingleton<_i738.PermissionService>(() => _i738.PermissionService());
    gh.factory<_i445.AuthInterceptor>(
      () => _i445.AuthInterceptor(gh<_i754.TokenStorage>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.dio(
        gh<String>(instanceName: 'baseUrl'),
        gh<_i445.AuthInterceptor>(),
      ),
    );
    gh.factory<_i454.ApiClient>(() => _i454.ApiClient(gh<_i361.Dio>()));
  }
}

class _$CoreModule extends _i291.CoreModule {}

class _$NetworkModule extends _i951.NetworkModule {}
