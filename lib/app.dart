import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/app_flavor.dart';
import 'core/dependency/di.dart';
import 'core/router/app_router.dart';
import 'core/translations/strings.g.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final flavor = getIt<AppFlavor>();
    final appRouter = getIt<AppRouter>();

    return TranslationProvider(
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            title: flavor.title,
            locale: TranslationProvider.of(context).flutterLocale, // use provider
            supportedLocales: AppLocaleUtils.supportedLocales,
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
            debugShowCheckedModeBanner: kDebugMode,
            theme: ThemeData(primarySwatch: Colors.blue),
            routerConfig: appRouter.config(),
            builder: (context, child) {
              return _flavorBanner(
                child: child ?? const SizedBox(),
                show: kDebugMode || flavor.enableLogs,
                flavorName: flavor.name,
              );
            },
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
