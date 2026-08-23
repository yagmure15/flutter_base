import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_base_core/flutter_base_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/firebase_options.dart';
import 'core/dependency/di.dart';

Future<void> bootstrap({
  required FutureOr<Widget> Function() builder,
  required String environment,
}) async {
  await runZonedGuarded(
    () async {
      /// Initialize Flutter
      WidgetsFlutterBinding.ensureInitialized();
      await _initializeFirebase();

      /// Setup DI
      await configureDependencies(environment: environment);
      final monitoringService = getIt<MonitoringService>();
      await monitoringService.initialize();

      /// Initializes Bloc observer.
      Bloc.observer = AppBlocObserver(monitoringService);

      /// Setup Error Handling
      FlutterError.onError = (details) {
        log(details.exceptionAsString(), stackTrace: details.stack);
        monitoringService.recordFlutterError(details);
      };

      /// Run App
      runApp(await builder());
    },
    (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      if (getIt.isRegistered<MonitoringService>()) {
        getIt<MonitoringService>().recordError(error, stackTrace, fatal: true);
      }
    },
  );
}

/// Initializes Firebase if it has been configured for the current platform.
///
/// Until `flutterfire configure` has been run, [DefaultFirebaseOptions] throws
/// an [UnsupportedError]; in that case the app keeps running and
/// `MonitoringService` falls back to console logging.
Future<void> _initializeFirebase() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // The FlutterFire placeholder throws an Error (not an Exception) when the
    // platform has not been configured yet, so it has to be caught here.
    // ignore: avoid_catching_errors
  } on UnsupportedError catch (e) {
    log('Firebase is not configured for this platform, skipping: ${e.message}');
  } on Exception catch (e, stackTrace) {
    log('Firebase initialization failed: $e', stackTrace: stackTrace);
  }
}
