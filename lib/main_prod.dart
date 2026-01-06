import 'app.dart';
import 'bootstrap.dart';

void main() {
  bootstrap(
    builder: () => const App(),
    environment: 'prod',
  );
}
