import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'core/dependency/di.dart';
import 'flavors.dart';
import 'pages/my_home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final flavor = getIt<AppFlavor>();

    return MaterialApp(
      title: flavor.title,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _flavorBanner(
        child: const MyHomePage(),
        show: kDebugMode || flavor.enableLogs, // Show banner in debug or if enabled in flavor
        flavorName: flavor.name,
      ),
    );
  }

  Widget _flavorBanner({
    required Widget child,
    required String flavorName, bool show = true,
  }) =>
      show
          ? Banner(
              location: BannerLocation.topStart,
              message: flavorName,
              color: Colors.green.withAlpha(150),
              textStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12,
                letterSpacing: 1,
              ),
              textDirection: TextDirection.ltr,
              child: child,
            )
          : Container(child: child);
}
