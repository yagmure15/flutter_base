import 'package:envied/envied.dart';

part 'env_prod.g.dart';

@Envied(path: '.env.prod')
abstract class EnvProd {
  @EnviedField(varName: 'KEY')
  static const String key = _EnvProd.key;

  @EnviedField(varName: 'BASE_URL', defaultValue: 'https://api.example.com')
  static const String baseUrl = _EnvProd.baseUrl;
}
