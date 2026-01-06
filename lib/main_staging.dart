import 'app.dart';
import 'bootstrap.dart';
import 'flavors.dart';

void main() {
  bootstrap(
    builder: () => const App(),
    environment: Env.staging,
  );
}
