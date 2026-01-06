import 'package:injectable/injectable.dart';

import '../../flavors.dart';

@module
abstract class AppModule {
  @Named('baseUrl')
  @lazySingleton
  String baseUrl(AppFlavor flavor) => flavor.baseUrl;
}
