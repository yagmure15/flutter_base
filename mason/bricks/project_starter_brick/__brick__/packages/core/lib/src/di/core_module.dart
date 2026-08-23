import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';

import '../monitoring/monitoring_service.dart';
import '../services/connectivity_service.dart';
import '../storage/key_value_storage.dart';

/// Registrations for core services that need custom construction.
///
/// Simple classes (e.g. `ApiClient`, `PermissionService`) are annotated
/// directly; everything here is exposed to apps through the generated
/// `{{name.pascalCase()}}CorePackageModule` micro package.
@module
abstract class CoreModule {
  /// Falls back to [LoggerMonitoringService] until Firebase is configured
  /// (`flutterfire configure`) and initialized by the app's bootstrap.
  @lazySingleton
  MonitoringService monitoringService() => Firebase.apps.isEmpty
      ? const LoggerMonitoringService()
      : FirebaseMonitoringService(
          FirebaseAnalytics.instance,
          FirebaseCrashlytics.instance,
        );

  /// SharedPreferences-backed storage, initialized before the app starts.
  @preResolve
  @singleton
  Future<KeyValueStorage> keyValueStorage() async {
    final storage = KeyValueStorageImpl();
    await storage.init();
    return storage;
  }

  @lazySingleton
  ConnectivityService connectivityService() => ConnectivityService();
}
