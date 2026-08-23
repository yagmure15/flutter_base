import 'package:envied/envied.dart';

part 'env_dev.g.dart';

@Envied(path: '.env.dev', obfuscate: true)
abstract class EnvDev {
  @EnviedField(varName: 'KEY')
  static final String key = _EnvDev.key;

  @EnviedField(varName: 'BASE_URL', defaultValue: 'https://dev.api.example.com')
  static final String baseUrl = _EnvDev.baseUrl;
}
