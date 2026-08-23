import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Create a dummy widget class if AppColors isn't a widget
class ColorPalette extends StatelessWidget {
  const ColorPalette({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Core Colors',
            style: Theme.of(context).textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const _ColorGrid(
            colors: [
              ('Primary', AppColors.primary),
              ('Primary Var', AppColors.primaryVariant),
              ('Secondary', AppColors.secondary),
              ('Sec Var', AppColors.secondaryVariant),
              ('Error', AppColors.error),
              ('Background', AppColors.background),
              ('Surface', AppColors.surface),
            ],
          ),
          const SizedBox(height: 32),
          Text(
            'Grey Scale',
            style: Theme.of(context).textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const _ColorGrid(
            colors: [
              ('Grey 50', AppColors.grey50),
              ('Grey 100', AppColors.grey100),
              ('Grey 200', AppColors.grey200),
              ('Grey 300', AppColors.grey300),
              ('Grey 400', AppColors.grey400),
              ('Grey 500', AppColors.grey500),
              ('Grey 600', AppColors.grey600),
              ('Grey 700', AppColors.grey700),
              ('Grey 800', AppColors.grey800),
              ('Grey 900', AppColors.grey900),
            ],
          ),
        ],
      ),
    );
  }
}

class _ColorGrid extends StatelessWidget {
  const _ColorGrid({required this.colors});

  final List<(String, Color)> colors;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisExtent: 140,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final (name, color) = colors[index];
        return _ColorCard(name: name, color: color);
      },
    );
  }
}

class _ColorCard extends StatelessWidget {
  const _ColorCard({required this.name, required this.color});

  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final isDark = color.computeLuminance() < 0.5;
    final textColor = isDark ? Colors.white : Colors.black;

    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.black.withAlpha(10), width: 1),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            name,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '#${color.toARGB32().toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}',
            style: TextStyle(
              color: textColor.withAlpha(180),
              fontSize: 12,
              fontFamily: 'monospace',
            ),
          ),
        ],
      ),
    );
  }
}

@widgetbook.UseCase(name: 'Palette', type: ColorPalette)
Widget colorPalette(BuildContext context) {
  return const ColorPalette();
}
