import 'package:flutter/material.dart';

class WidgetbookShell extends StatelessWidget {
  const WidgetbookShell({required this.child, this.label, super.key});

  final Widget child;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(32),
      color: Theme.of(context).brightness == Brightness.light
          ? Colors.grey.shade50
          : Colors.grey.shade900,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (label != null) ...[
              Text(
                label!,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Colors.grey,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
            ],
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(20),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
