import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';

import 'core/dependency/di.dart';

Future<void> bootstrap({
  required FutureOr<Widget> Function() builder,
  required String environment,
}) async {
  /// Setup DI
  configureDependencies(environment: environment);

  /// Setup Error Handling
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await runZonedGuarded(
    () async {
      runApp(await builder());
    },
    (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
    },
  );
}
