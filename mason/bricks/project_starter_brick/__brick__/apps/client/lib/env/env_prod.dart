import 'package:envied/envied.dart';

part 'env_prod.g.dart';

@Envied(path: '.env.prod', obfuscate: true)
abstract class EnvProd {
  @EnviedField(varName: 'KEY')
  static final String key = _EnvProd.key;

  @EnviedField(varName: 'BASE_URL', defaultValue: 'https://api.example.com')
  static final String baseUrl = _EnvProd.baseUrl;
}
