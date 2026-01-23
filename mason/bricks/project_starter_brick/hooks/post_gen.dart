import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final directory = Directory.current;

  // 0. Fix .env files (rename dot.env to .env)
  final envFixProgress = context.logger.progress('Configuring .env files...');
  final clientDir = Directory('apps/client');
  if (clientDir.existsSync()) {
    for (final file in clientDir.listSync()) {
      if (file is File && file.path.contains('dot.env')) {
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
  final genProgress = context.logger.progress('Generating code...');
  final gen = await Process.run('melos', ['run', 'gen'], runInShell: true);
  if (gen.exitCode != 0) {
    genProgress.fail('Code generation failed. You might need to run "melos run gen" manually.');
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
    for (final line in output.split('\n')) {
      if (line.contains('●')) {
        final parts = line.split(RegExp(r'\s+'));
        for (var i = 0; i < parts.length; i++) {
          if (parts[i].contains('●')) {
            // Look for the version string in neighbor parts
            if (i > 0)
              globalVersion = parts[i - 1];
            else if (i < parts.length - 1)
              globalVersion = parts[i + 1];
            break;
          }
          if (parts[i].isNotEmpty && !parts[i].contains('│') && !parts[i].contains('─')) {
            globalVersion = parts[i];
          }
        }
      }
    }

    if (globalVersion != null && globalVersion.isNotEmpty) {
      await Process.run('fvm', ['use', globalVersion, '--force'], runInShell: true);
      fvmProgress.complete('FVM configured with Flutter $globalVersion');
    } else {
      fvmProgress.fail('Could not detect global FVM version.');
    }
  } else {
    fvmProgress.fail('FVM not found.');
  }

  context.logger.success('\n✨ Project setup complete! 🚀\n');
}
