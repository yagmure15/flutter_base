import 'package:flutter/material.dart';

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
              const Text('This app demonstrates that the core package compiles.'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Example usage of logger from core
                  final logger = Logger();
                  logger.i('Hello from Core!');
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
