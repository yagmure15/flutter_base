import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final directory = Directory.current;

  // 0. Fix .env files (rename dot.env to .env)
  final envFixProgress = context.logger.progress('Configuring .env files...');
  final clientDir = Directory('apps/client');
  if (clientDir.existsSync()) {
    for (final file in clientDir.listSync()) {
      final fileName = file.path.split(Platform.pathSeparator).last;
      if (file is File && fileName.startsWith('dot.env')) {
        final newPath = file.path.replaceFirst('dot.env', '.env');
        file.renameSync(newPath);
      }
    }
  }
  envFixProgress.complete('.env files configured.');

  // 1. Install Melos if needed and Bootstrap
  final bootstrapProgress = context.logger.progress('Bootstrapping project (melos bootstrap)...');

  var melosResult = await Process.run('melos', ['--version'], runInShell: true);
  if (melosResult.exitCode != 0) {
    bootstrapProgress.update('Melos not found, activating globally...');
    await Process.run('dart', ['pub', 'global', 'activate', 'melos'], runInShell: true);
  }

  final bootstrap = await Process.run('melos', ['bootstrap'], runInShell: true);
  if (bootstrap.exitCode != 0) {
    bootstrapProgress.fail('Bootstrap failed: ${bootstrap.stderr}');
    return;
  }
  bootstrapProgress.complete('Bootstrap completed.');

  // 2. Generate Code (Build Runner)
  final genProgress = context.logger.progress('Generating code (Freezed, Envied etc.)...');
  final gen = await Process.run('melos', ['run', 'gen'], runInShell: true);
  if (gen.exitCode != 0) {
    genProgress.fail('Code generation failed. You might need to run "melos run gen" manually.');
    context.logger.info(gen.stderr);
    context.logger.info(gen.stdout);
  } else {
    genProgress.complete('Code generation completed.');
  }

  // 3. Auto Fix & Format
  final fixProgress = context.logger.progress('Applying fixes and formatting...');
  await Process.run('melos', ['exec', '--', 'dart', 'fix', '--apply'], runInShell: true);
  await Process.run('melos', ['run', 'format'], runInShell: true);
  fixProgress.complete('Code fixed and formatted.');

  // 4. Final Analysis
  final analyzeProgress = context.logger.progress('Running final analysis...');
  final analyze = await Process.run('melos', ['run', 'analyze'], runInShell: true);
  if (analyze.exitCode != 0) {
    analyzeProgress.complete('Analysis finished with issues.');
    context.logger.info(analyze.stdout);
  } else {
    analyzeProgress.complete('Analysis passed successfully! 🚀');
  }

  // 5. Setup FVM (Optional and more robust)
  final fvmProgress = context.logger.progress('Setting up FVM...');
  var fvmCheck = await Process.run('fvm', ['--version'], runInShell: true);
  if (fvmCheck.exitCode == 0) {
    final fvmList = await Process.run('fvm', ['list'], runInShell: true);
    final output = fvmList.stdout.toString();
    String? globalVersion;

    // Improved parsing for fvm list
    for (final line in output.split('\n')) {
      if (line.contains('●')) {
        // Line usually looks like: 3.27.0 │ │ ●
        // We take the first part which is the version
        final match = RegExp(r'^([\d\.\w\-]+)').firstMatch(line.trim());
        if (match != null) {
          globalVersion = match.group(1);
          break;
        }
      }
    }

    if (globalVersion != null && globalVersion.isNotEmpty) {
      final fvmUse = await Process.run('fvm', ['use', globalVersion, '--force'], runInShell: true);
      if (fvmUse.exitCode == 0) {
        fvmProgress.complete('FVM configured with Flutter $globalVersion');
      } else {
        fvmProgress.fail('FVM use failed: ${fvmUse.stderr}');
      }
    } else {
      fvmProgress.fail('Could not detect global FVM version. Set one with "fvm global <version>".');
    }
  } else {
    fvmProgress.fail('FVM not found.');
  }

  context.logger.success('\n✨ Project setup complete! 🚀\n');
}
