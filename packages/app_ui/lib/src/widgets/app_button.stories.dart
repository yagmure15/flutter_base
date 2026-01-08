import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Primary',
  type: AppButton,
)
Widget primaryButton(BuildContext context) {
  return AppButton(
    text: 'Click Me',
    onPressed: () {},
  );
}

@widgetbook.UseCase(
  name: 'Colored',
  type: AppButton,
)
Widget coloredButton(BuildContext context) {
  return AppButton(
    text: 'Colored Button',
    color: AppColors.error,
    onPressed: () {},
  );
}
