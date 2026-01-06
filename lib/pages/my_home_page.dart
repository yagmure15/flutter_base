import 'package:flutter/material.dart';

import '../core/dependency/di.dart';
import '../flavors.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final flavor = getIt<AppFlavor>();

    return Scaffold(
      appBar: AppBar(title: Text(flavor.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello ${flavor.title}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'Base URL:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              flavor.baseUrl,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontFamily: 'monospace',
                  ),
            ),
            const SizedBox(height: 8),
            if (flavor.enableLogs) const Chip(label: Text('Logs Enabled')),
          ],
        ),
      ),
    );
  }
}
