import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final directory = Directory.current;

  // 1. Install Melos if needed and Bootstrap
  final bootstrapProgress = context.logger.progress('Bootstrapping project (melos bootstrap)...');

  // Ensure we are in a clean state or try to find melos
  var melosResult = await Process.run('melos', ['--version'], runInShell: true);
  if (melosResult.exitCode != 0) {
    bootstrapProgress.update('Melos not found, activating globally...');
    await Process.run('dart', ['pub', 'global', 'activate', 'melos'], runInShell: true);
  }

  // Run Bootstrap
  final bootstrap = await Process.run('melos', ['bootstrap'], runInShell: true);
  if (bootstrap.exitCode != 0) {
    bootstrapProgress.fail('Bootstrap failed: ${bootstrap.stderr}');
    return;
  }
  bootstrapProgress.complete('Bootstrap completed.');

  // 2. Generate Code (Build Runner)
  // This is essential for Freezed, AutoRoute etc.
  final genProgress = context.logger.progress('Generating code (This may take a while)...');
  final gen = await Process.run('melos', ['run', 'gen'], runInShell: true);
  if (gen.exitCode != 0) {
    genProgress.fail('Code generation failed. You might need to run "melos run gen" manually.\n${gen.stderr}');
  } else {
    genProgress.complete('Code generation completed.');
  }

  // 3. Auto Fix & Format
  final fixProgress = context.logger.progress('Applying fixes and formatting...');

  // Apply changes using dart fix
  await Process.run('melos', ['exec', '--', 'dart', 'fix', '--apply'], runInShell: true);

  // Format code
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

  // 5. Setup FVM (at the end, after everything is ready)
  final fvmProgress = context.logger.progress('Setting up FVM...');

  // Check if FVM is installed
  var fvmCheck = await Process.run('fvm', ['--version'], runInShell: true);
  if (fvmCheck.exitCode != 0) {
    fvmProgress.fail('FVM not found. Please install FVM first: https://fvm.app/docs/getting_started/installation');
    context.logger.warn('⚠️  You can still use the project, but we recommend installing FVM for version management.');
    return;
  }

  // Get global FVM version
  final fvmList = await Process.run('fvm', ['list'], runInShell: true);
  final output = fvmList.stdout.toString();

  // Extract global version (line with ● in Global column)
  String? globalVersion;
  for (final line in output.split('\n')) {
    if (line.contains('●') && line.contains('│')) {
      final parts = line.split('│');
      if (parts.isNotEmpty) {
        globalVersion = parts[0].replaceAll('│', '').replaceAll('●', '').trim();
        break;
      }
    }
  }

  if (globalVersion == null || globalVersion.isEmpty) {
    fvmProgress.fail('Could not detect global FVM version. Please set one with: fvm global <version>');
    context.logger.warn('⚠️  Skipping FVM setup. You can run "fvm use <version>" manually later.');
    return;
  }

  fvmProgress.update('Using Flutter version: $globalVersion');

  // Initialize FVM for this project
  final fvmUse = await Process.run('fvm', ['use', globalVersion, '--force'], runInShell: true);
  if (fvmUse.exitCode != 0) {
    fvmProgress.fail('FVM setup failed: ${fvmUse.stderr}');
    context.logger.warn('⚠️  You can run "fvm use $globalVersion" manually later.');
    return;
  }

  fvmProgress.complete('FVM configured with Flutter $globalVersion');

  context.logger.success('\n✨ Project setup complete! You can now start developing.\n');
}
