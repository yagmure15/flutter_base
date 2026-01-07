import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';

import 'core/dependency/di.dart';
import 'core/translations/strings.g.dart';

Future<void> bootstrap({
  required FutureOr<Widget> Function() builder,
  required String environment,
}) async {
  await runZonedGuarded(
    () async {
      /// Initialize Flutter
      WidgetsFlutterBinding.ensureInitialized();

      /// Setup DI
      await configureDependencies(environment: environment);

      /// Setup Locale
      await LocaleSettings.useDeviceLocale();

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
