import 'package:design_system/design_system.dart';
import 'package:design_system/src/widgetbook_shell.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Primary',
  type: AppButton,
)
Widget primaryButton(BuildContext context) {
  return const WidgetbookShell(
    label: 'Primary Button',
    child: AppButton(
      text: 'Click Me',
      onPressed: null, // Disabled in preview for purity or keep as is
    ),
  );
}

@widgetbook.UseCase(
  name: 'Colored',
  type: AppButton,
)
Widget coloredButton(BuildContext context) {
  return WidgetbookShell(
    label: 'Colored Button',
    child: AppButton(
      text: 'Colored Button',
      color: AppColors.error,
      onPressed: () {},
    ),
  );
}
