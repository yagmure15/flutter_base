// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:{{name.snakeCase()}}_core/core.dart' as _i917;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../config/app_flavor.dart' as _i954;
import '../../features/test_feature/data/datasources/test_feature_remote_datasource.dart'
    as _i906;
import '../../features/test_feature/data/repositories/test_feature_repository_impl.dart'
    as _i244;
import '../../features/test_feature/domain/repositories/test_feature_repository.dart'
    as _i1048;
import '../../features/test_feature/domain/usecases/get_test_feature.dart'
    as _i439;
import '../../features/test_feature/presentation/bloc/test_feature_cubit.dart'
    as _i751;
import '../router/app_router.dart' as _i81;
import '../storage/secure_token_storage.dart' as _i535;
import '../translations/strings.g.dart' as _i232;
import 'app_module.dart' as _i460;

const String _dev = 'dev';
const String _staging = 'staging';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    await gh.singletonAsync<_i232.Translations>(
      () => appModule.translations,
      preResolve: true,
    );
    gh.singleton<_i81.AppRouter>(() => _i81.AppRouter());
    gh.lazySingleton<_i906.TestFeatureRemoteDataSource>(
        () => _i906.TestFeatureRemoteDataSourceImpl());
    gh.singleton<_i954.AppFlavor>(
      () => _i954.DevFlavor(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i1048.TestFeatureRepository>(() =>
        _i244.TestFeatureRepositoryImpl(
            gh<_i906.TestFeatureRemoteDataSource>()));
    gh.lazySingleton<_i917.TokenStorage>(() => _i535.SecureTokenStorage());
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
    gh.lazySingleton<_i439.GetTestFeature>(
        () => _i439.GetTestFeature(gh<_i1048.TestFeatureRepository>()));
    gh.factory<_i751.TestFeatureCubit>(
        () => _i751.TestFeatureCubit(gh<_i439.GetTestFeature>()));
    return this;
  }
}

class _$AppModule extends _i460.AppModule {}
