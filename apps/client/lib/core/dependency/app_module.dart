import 'package:injectable/injectable.dart';

import '../../config/app_flavor.dart';
import '../translations/strings.g.dart';

@module
abstract class AppModule {
  @preResolve
  @singleton
  Future<Translations> get translations async {
    // 1. Cihazın dilini bul ve ayarla (Bekliyoruz)
    LocaleSettings.useDeviceLocale();

    // 2. Hazır olan çeviri nesnesini sisteme ver
    return LocaleSettings.instance.currentTranslations;
  }

  @Named('baseUrl')
  @lazySingleton
  String baseUrl(AppFlavor flavor) => flavor.baseUrl;
}
