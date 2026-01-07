import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../config/app_flavor.dart';
import '../../../../core/dependency/di.dart';
import '../../../../core/translations/strings.g.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              t.home.hello(name: flavor.title),
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
