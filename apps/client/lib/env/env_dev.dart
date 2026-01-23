import 'package:envied/envied.dart';

part 'env_dev.g.dart';

@Envied(path: '.env.dev')
abstract class EnvDev {
  @EnviedField(varName: 'KEY')
  static const String key = _EnvDev.key;

  @EnviedField(
    varName: 'BASE_URL',
    defaultValue: 'https://dev.api.example.com',
  )
  static const String baseUrl = _EnvDev.baseUrl;
}
