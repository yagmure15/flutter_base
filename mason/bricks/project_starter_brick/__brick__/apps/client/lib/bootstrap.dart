import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:{{name.snakeCase()}}_core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/firebase_options.dart';
import 'core/dependency/di.dart';

Future<void> bootstrap({required FutureOr<Widget> Function() builder, required String environment}) async {
  await runZonedGuarded(
    () async {
      /// Initialize Flutter
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

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
      getIt<MonitoringService>().recordError(error, stackTrace, fatal: true);
    },
  );
}
