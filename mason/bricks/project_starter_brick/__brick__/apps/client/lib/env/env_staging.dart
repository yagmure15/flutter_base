import 'package:envied/envied.dart';

part 'env_staging.g.dart';

@Envied(path: '.env.staging', obfuscate: true)
abstract class EnvStaging {
  @EnviedField(varName: 'KEY')
  static final String key = _EnvStaging.key;

  @EnviedField(
    varName: 'BASE_URL',
    defaultValue: 'https://staging.api.example.com',
  )
  static final String baseUrl = _EnvStaging.baseUrl;
}
