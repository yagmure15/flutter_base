import 'package:injectable/injectable.dart';

import '../../config/app_flavor.dart';

@module
abstract class AppModule {
  @Named('baseUrl')
  @lazySingleton
  String baseUrl(AppFlavor flavor) => flavor.baseUrl;
}
