import 'package:envied/envied.dart';

part 'env_staging.g.dart';

@Envied(path: '.env.staging')
abstract class EnvStaging {
  @EnviedField(varName: 'KEY')
  static const String key = _EnvStaging.key;

  @EnviedField(
    varName: 'BASE_URL',
    defaultValue: 'https://staging.api.example.com',
  )
  static const String baseUrl = _EnvStaging.baseUrl;
}
