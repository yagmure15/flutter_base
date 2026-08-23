import 'app.dart';
import 'bootstrap.dart';
import 'config/app_flavor.dart';

void main() {
  bootstrap(builder: () => const App(), environment: Env.staging);
}
