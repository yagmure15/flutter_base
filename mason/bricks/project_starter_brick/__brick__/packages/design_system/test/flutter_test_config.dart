import 'dart:async';

import 'package:alchemist/alchemist.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  // ignore: avoid_print
  print('Running Alchemist tests...');
  return AlchemistConfig.runWithConfig(
    config: const AlchemistConfig(
      platformGoldensConfig: PlatformGoldensConfig(
        enabled: true,
      ),
    ),
    run: testMain,
  );
}
