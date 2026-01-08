import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/dependency/di.dart';
import 'core/monitoring/app_bloc_observer.dart';
import 'core/translations/strings.g.dart';

Future<void> bootstrap({required FutureOr<Widget> Function() builder, required String environment}) async {
  await runZonedGuarded(
    () async {
      /// Initialize Flutter
      WidgetsFlutterBinding.ensureInitialized();

      /// Setup DI
      await configureDependencies(environment: environment);

      /// Setup Locale
      LocaleSettings.useDeviceLocale();

      /// Initializes Bloc observer.
      Bloc.observer = AppBlocObserver();

      /// Setup Error Handling
      FlutterError.onError = (details) {
        log(details.exceptionAsString(), stackTrace: details.stack);
      };

      /// Run App
      runApp(await builder());
    },
    (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
    },
  );
}
