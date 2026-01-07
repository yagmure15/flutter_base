// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../config/app_flavor.dart' as _i954;
import 'app_module.dart' as _i460;

const String _dev = 'dev';
const String _staging = 'staging';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.singleton<_i954.AppFlavor>(() => _i954.DevFlavor(), registerFor: {_dev});
    gh.singleton<_i954.AppFlavor>(
      () => _i954.StagingFlavor(),
      registerFor: {_staging},
    );
    gh.singleton<_i954.AppFlavor>(
      () => _i954.ProdFlavor(),
      registerFor: {_prod},
    );
    gh.lazySingleton<String>(
      () => appModule.baseUrl(gh<_i954.AppFlavor>()),
      instanceName: 'baseUrl',
    );
    return this;
  }
}

class _$AppModule extends _i460.AppModule {}
