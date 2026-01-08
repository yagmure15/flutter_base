import 'package:app_ui/src/introduction/app_welcome.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Welcome',
  type: AppWelcome,
)
Widget appWelcome(BuildContext context) {
  return const AppWelcome();
}
