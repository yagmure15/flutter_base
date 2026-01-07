import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/app_flavor.dart';
import 'core/dependency/di.dart';
import 'core/translations/strings.g.dart';
import 'features/auth/presentation/pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final flavor = getIt<AppFlavor>();

    return TranslationProvider(
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: flavor.title,
            locale: TranslationProvider.of(context).flutterLocale, // use provider
            supportedLocales: AppLocaleUtils.supportedLocales,
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
            debugShowCheckedModeBanner: kDebugMode,
            theme: ThemeData(primarySwatch: Colors.blue),
            home: _flavorBanner(
              child: const HomePage(),
              show: kDebugMode || flavor.enableLogs, // Show banner in debug or if enabled in flavor
              flavorName: flavor.name,
            ),
          );
        },
      ),
    );
  }

  Widget _flavorBanner({
    required Widget child,
    required String flavorName,
    bool show = true,
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
