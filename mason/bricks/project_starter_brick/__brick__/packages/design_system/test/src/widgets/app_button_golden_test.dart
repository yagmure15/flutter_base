import 'package:alchemist/alchemist.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppButton Golden Tests', () {
    goldenTest(
      'renders correctly',
      fileName: 'app_button',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'Default',
            child: AppButton(
              text: 'Click Me',
              onPressed: () {},
            ),
          ),
          GoldenTestScenario(
            name: 'Custom Color',
            child: AppButton(
              text: 'Danger',
              color: Colors.red,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  });
}
