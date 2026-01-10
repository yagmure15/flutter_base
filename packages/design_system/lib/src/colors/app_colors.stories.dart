import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Create a dummy widget class if AppColors isn't a widget
class ColorPalette extends StatelessWidget {
  const ColorPalette({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        _ColorItem('Primary', AppColors.primary),
        _ColorItem('Primary Variant', AppColors.primaryVariant),
        _ColorItem('Secondary', AppColors.secondary),
        _ColorItem('Secondary Variant', AppColors.secondaryVariant),
        _ColorItem('Error', AppColors.error),
        _ColorItem('Background', AppColors.background),
        _ColorItem('Surface', AppColors.surface),
        Divider(),
        _ColorItem('Grey 50', AppColors.grey50),
        _ColorItem('Grey 100', AppColors.grey100),
        _ColorItem('Grey 200', AppColors.grey200),
        _ColorItem('Grey 300', AppColors.grey300),
        _ColorItem('Grey 400', AppColors.grey400),
        _ColorItem('Grey 500', AppColors.grey500),
        _ColorItem('Grey 600', AppColors.grey600),
        _ColorItem('Grey 700', AppColors.grey700),
        _ColorItem('Grey 800', AppColors.grey800),
        _ColorItem('Grey 900', AppColors.grey900),
      ],
    );
  }
}

class _ColorItem extends StatelessWidget {
  const _ColorItem(this.name, this.color);

  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      title: Text(name),
      subtitle: Text(
        '0x${(color.a * 255).round().toRadixString(16).padLeft(2, '0')}'
                '${(color.r * 255).round().toRadixString(16).padLeft(2, '0')}'
                '${(color.g * 255).round().toRadixString(16).padLeft(2, '0')}'
                '${(color.b * 255).round().toRadixString(16).padLeft(2, '0')}'
            .toUpperCase(),
      ),
    );
  }
}

@widgetbook.UseCase(
  name: 'Palette',
  type: ColorPalette,
)
Widget colorPalette(BuildContext context) {
  return const ColorPalette();
}
