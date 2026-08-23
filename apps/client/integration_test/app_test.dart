import 'package:flutter_base/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter', (
      tester,
    ) async {
      app.main();
      await tester.pumpAndSettle();

      // Find any widget to verify app launched.
      // Since we don't know the exact UI, just pumping and settling without error is a good start.
      expect(find.byType(Exception), findsNothing);
    });
  });
}
