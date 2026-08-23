import 'package:flutter/material.dart';
import 'package:flutter_base/config/app_flavor.dart';
import 'package:flutter_base/core/dependency/di.dart';
import 'package:flutter_base/core/translations/strings.g.dart';
import 'package:flutter_base/features/home/presentation/pages/home_page.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeFlavor implements AppFlavor {
  const _FakeFlavor({required this.enableLogs});

  @override
  final bool enableLogs;

  @override
  String get title => 'Test Title';

  @override
  String get baseUrl => 'https://test.example.com';

  @override
  String get name => 'TEST';
}

void main() {
  tearDown(() async {
    await getIt.reset();
  });

  Future<void> pumpHome(WidgetTester tester, {required bool enableLogs}) async {
    getIt.registerSingleton<AppFlavor>(_FakeFlavor(enableLogs: enableLogs));
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
  }

  group('HomePage', () {
    testWidgets('shows the flavor title, greeting and base URL', (
      tester,
    ) async {
      await pumpHome(tester, enableLogs: false);

      expect(find.text('Test Title'), findsOneWidget); // AppBar
      expect(find.text(t.home.hello(name: 'Test Title')), findsOneWidget);
      expect(find.text('https://test.example.com'), findsOneWidget);
      expect(find.text('Logs Enabled'), findsNothing);
    });

    testWidgets('shows the logs chip when logging is enabled', (tester) async {
      await pumpHome(tester, enableLogs: true);

      expect(find.text('Logs Enabled'), findsOneWidget);
    });
  });
}
