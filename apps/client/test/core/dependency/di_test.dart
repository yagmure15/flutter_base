import 'package:flutter_base/config/app_flavor.dart';
import 'package:flutter_base/core/dependency/di.dart';
import 'package:flutter_base/core/router/app_router.dart';
import 'package:flutter_base/core/storage/secure_token_storage.dart';
import 'package:flutter_base/core/translations/strings.g.dart';
import 'package:flutter_base_core/flutter_base_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Smoke test for the service locator: every registration the app relies on
/// at startup must resolve, including the ones coming from the
/// `flutter_base_core` micro package.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  tearDown(() async {
    await getIt.reset();
  });

  group('configureDependencies', () {
    test('registers the flavor matching the environment', () async {
      await configureDependencies(environment: Env.staging);

      expect(getIt<AppFlavor>(), isA<StagingFlavor>());
    });

    test('resolves core services through the micro package', () async {
      await configureDependencies(environment: Env.dev);

      // Firebase is never initialized in tests, so the console fallback is used.
      expect(getIt<MonitoringService>(), isA<LoggerMonitoringService>());
      expect(getIt<KeyValueStorage>(), isA<KeyValueStorageImpl>());
      expect(getIt<ConnectivityService>(), isNotNull);
      expect(getIt<PermissionService>(), isNotNull);
    });

    test('resolves the network stack with app-provided dependencies', () async {
      await configureDependencies(environment: Env.dev);

      // ApiClient -> Dio -> (@Named baseUrl, AuthInterceptor -> TokenStorage)
      expect(getIt<TokenStorage>(), isA<SecureTokenStorage>());
      expect(getIt<ApiClient>(), isNotNull);
      expect(getIt<String>(instanceName: 'baseUrl'), DevFlavor().baseUrl);
    });

    test('pre-resolves translations and registers the router', () async {
      await configureDependencies(environment: Env.prod);

      expect(getIt<Translations>(), isNotNull);
      expect(getIt<AppRouter>(), isNotNull);
    });
  });
}
