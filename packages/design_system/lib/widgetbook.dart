import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the generated file
import 'widgetbook.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

// Annotation to trigger generator
@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      initialRoute: '?path=introduction/appwelcome/welcome',
      directories: directories,
      addons: [
        ViewportAddon([
          ViewportData(
            name: 'iPhone 13',
            width: Devices.ios.iPhone13.screenSize.width,
            height: Devices.ios.iPhone13.screenSize.height,
            pixelRatio: Devices.ios.iPhone13.pixelRatio,
            platform: TargetPlatform.iOS,
          ),
          ViewportData(
            name: 'iPad',
            width: Devices.ios.iPad.screenSize.width,
            height: Devices.ios.iPad.screenSize.height,
            pixelRatio: Devices.ios.iPad.pixelRatio,
            platform: TargetPlatform.iOS,
          ),
          ViewportData(
            name: 'Samsung Galaxy S20',
            width: Devices.android.samsungGalaxyS20.screenSize.width,
            height: Devices.android.samsungGalaxyS20.screenSize.height,
            pixelRatio: Devices.android.samsungGalaxyS20.pixelRatio,
            platform: TargetPlatform.android,
          ),
        ]),
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(name: 'Light', data: AppTheme.lightTheme),
            WidgetbookTheme(name: 'Dark', data: AppTheme.darkTheme),
          ],
        ),
        TextScaleAddon(min: 1.0, max: 2.0),
      ],
    );
  }
}
