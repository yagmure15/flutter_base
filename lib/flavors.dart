import 'package:injectable/injectable.dart';

import 'env/env_dev.dart';
import 'env/env_prod.dart';
import 'env/env_staging.dart';

abstract class Env {
  /// Development environment
  ///
  /// value as String: [dev]
  static const dev = 'dev';

  /// Staging environment
  ///
  /// value as String: [staging]
  static const staging = 'staging';

  /// Production environment
  ///
  /// value as String: [prod]
  static const prod = 'prod';
}

abstract class AppFlavor {
  String get title;
  String get baseUrl;
  bool get enableLogs;
  String get name;
}

@Singleton(as: AppFlavor)
@Environment(Env.dev)
class DevFlavor implements AppFlavor {
  @override
  String get title => 'Flutter Base Dev';

  @override
  String get baseUrl => EnvDev.baseUrl;

  @override
  bool get enableLogs => true;

  @override
  String get name => 'DEV';
}

@Singleton(as: AppFlavor)
@Environment(Env.staging)
class StagingFlavor implements AppFlavor {
  @override
  String get title => 'Flutter Base Staging';

  @override
  String get baseUrl => EnvStaging.baseUrl;

  @override
  bool get enableLogs => true;

  @override
  String get name => 'STAGING';
}

@Singleton(as: AppFlavor)
@Environment(Env.prod)
class ProdFlavor implements AppFlavor {
  @override
  String get title => 'Flutter Base';

  @override
  String get baseUrl => EnvProd.baseUrl;

  @override
  bool get enableLogs => false;

  @override
  String get name => 'PROD';
}
