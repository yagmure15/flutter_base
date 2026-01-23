import 'package:flutter/material.dart';
import 'package:flutter_base_core/flutter_base_core.dart';

void main() {
  runApp(const CoreExampleApp());
}

class CoreExampleApp extends StatelessWidget {
  const CoreExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter Base Core Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'This app demonstrates that the core package compiles.',
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Example usage of logger from core
                  logger.info('Hello from Core!');
                },
                child: const Text('Log Message'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
