import 'dart:convert';
import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final directory = Directory.current;

  // 0. Fix dot-files (rename dot.env* -> .env*, dot.fvmrc -> .fvmrc)
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
  final dotFvmrc = File('dot.fvmrc');
  if (dotFvmrc.existsSync()) {
    dotFvmrc.renameSync('.fvmrc');
  }
  envFixProgress.complete('.env files configured.');

  // 1. Sort dependencies in all pubspec.yaml files
  final sortProgress =
      context.logger.progress('Sorting dependencies in pubspec.yaml files...');
  _sortAllPubspecs(directory);
  sortProgress.complete('Dependencies sorted.');

  // 2. Setup FVM *before* bootstrapping so that melos/flutter/dart run with the
  //    SDK version pinned by the template (.fvmrc). Falls back to the global
  //    FVM version when .fvmrc is missing, and to PATH when FVM is not installed.
  final fvmProgress = context.logger.progress('Setting up FVM...');
  final fvmCheck = await Process.run('fvm', ['--version'], runInShell: true);
  if (fvmCheck.exitCode == 0) {
    final version = _readFvmrcVersion() ?? await _detectGlobalFvmVersion();
    if (version != null && version.isNotEmpty) {
      fvmProgress.update('Installing Flutter $version via FVM (if needed)...');
      await Process.run('fvm', ['install', version], runInShell: true);
      final fvmUse = await Process.run(
        'fvm',
        ['use', version, '--force', '--skip-pub-get'],
        runInShell: true,
      );
      if (fvmUse.exitCode == 0) {
        fvmProgress.complete('FVM configured with Flutter $version');
      } else {
        fvmProgress.fail('FVM use failed: ${fvmUse.stderr}');
      }
    } else {
      fvmProgress.fail('Could not detect a Flutter version for FVM.');
    }
  } else {
    fvmProgress.fail('FVM not found, using Flutter from PATH.');
  }

  // 3. Install Melos if needed and Bootstrap
  final bootstrapProgress =
      context.logger.progress('Bootstrapping project (melos bootstrap)...');

  final melosResult = await _run('melos', ['--version']);
  if (melosResult.exitCode != 0) {
    bootstrapProgress.update('Melos not found, activating globally...');
    await _run('dart', ['pub', 'global', 'activate', 'melos']);
  }

  final bootstrap = await _run('melos', ['bootstrap']);
  if (bootstrap.exitCode != 0) {
    bootstrapProgress.fail('Bootstrap failed: ${bootstrap.stderr}');
    return;
  }
  bootstrapProgress.complete('Bootstrap completed.');

  // 4. Generate Code (slang + build_runner)
  final genProgress = context.logger
      .progress('Generating code (Slang, Freezed, Envied etc.)...');
  final gen = await _run('melos', ['run', 'gen']);
  if (gen.exitCode != 0) {
    genProgress.fail(
      'Code generation failed. You might need to run "melos run gen" manually.',
    );
    context.logger.info(gen.stderr.toString());
    context.logger.info(gen.stdout.toString());
  } else {
    genProgress.complete('Code generation completed.');
  }

  // 5. Auto Fix & Format
  final fixProgress =
      context.logger.progress('Applying fixes and formatting...');
  await _run('melos', ['exec', '--', 'dart', 'fix', '--apply']);
  await _run('melos', ['run', 'format']);
  fixProgress.complete('Code fixed and formatted.');

  // 6. Final Analysis
  final analyzeProgress = context.logger.progress('Running final analysis...');
  final analyze = await _run('melos', ['run', 'analyze']);
  if (analyze.exitCode != 0) {
    analyzeProgress.complete('Analysis finished with issues.');
    context.logger.info(analyze.stdout.toString());
  } else {
    analyzeProgress.complete('Analysis passed successfully! 🚀');
  }

  context.logger.success('\n✨ Project setup complete! 🚀\n');
}

/// Reads the Flutter version pinned in `.fvmrc` (e.g. `{"flutter": "3.47.1"}`).
String? _readFvmrcVersion() {
  final file = File('.fvmrc');
  if (!file.existsSync()) return null;
  try {
    final json = jsonDecode(file.readAsStringSync());
    if (json is Map && json['flutter'] is String) {
      return json['flutter'] as String;
    }
  } catch (_) {
    // Ignore malformed .fvmrc and fall back to the global version.
  }
  return null;
}

/// Detects the global FVM version from `fvm list` output (marked with ●).
Future<String?> _detectGlobalFvmVersion() async {
  final fvmList = await Process.run('fvm', ['list'], runInShell: true);
  for (final line in fvmList.stdout.toString().split('\n')) {
    if (line.contains('●')) {
      final match = RegExp(r'^([\d\.\w\-]+)').firstMatch(line.trim());
      if (match != null) return match.group(1);
    }
  }
  return null;
}

/// Runs [executable] with the project's FVM SDK (`.fvm/flutter_sdk/bin`)
/// prepended to PATH when available, so melos/flutter/dart use the pinned SDK.
Future<ProcessResult> _run(String executable, List<String> arguments) {
  final sdkBin = Directory('${Directory.current.path}/.fvm/flutter_sdk/bin');
  final env = <String, String>{};
  if (sdkBin.existsSync()) {
    final separator = Platform.isWindows ? ';' : ':';
    env['PATH'] =
        '${sdkBin.path}$separator${Platform.environment['PATH'] ?? ''}';
  }
  return Process.run(executable, arguments, runInShell: true, environment: env);
}

void _sortAllPubspecs(Directory directory) {
  directory
      .listSync(recursive: true)
      .where((file) => file is File && file.path.endsWith('pubspec.yaml'))
      .cast<File>()
      .forEach(_sortPubspec);
}

void _sortPubspec(File file) {
  final lines = file.readAsLinesSync();
  final newLines = <String>[];

  var i = 0;
  while (i < lines.length) {
    final line = lines[i];
    final trimmed = line.trim();

    if (trimmed == 'dependencies:' || trimmed == 'dev_dependencies:') {
      newLines.add(line);
      i++;

      final dependencyBlock = <String>[];
      final currentIndent = line.indexOf(trimmed);

      while (i < lines.length) {
        final nextLine = lines[i];
        if (nextLine.trim().isEmpty) {
          dependencyBlock.add(nextLine);
          i++;
          continue;
        }

        final nextIndent = nextLine.indexOf(nextLine.trim());
        if (nextIndent <= currentIndent && nextLine.trim().isNotEmpty) {
          break;
        }

        dependencyBlock.add(nextLine);
        i++;
      }

      newLines.addAll(_sortDependencyBlock(dependencyBlock));
    } else {
      newLines.add(line);
      i++;
    }
  }

  file.writeAsStringSync('${newLines.join('\n')}\n');
}

List<String> _sortDependencyBlock(List<String> lines) {
  if (lines.isEmpty) return [];

  final entries = <_DependencyEntry>[];
  _DependencyEntry? currentEntry;

  for (final line in lines) {
    if (line.trim().isEmpty) {
      if (currentEntry != null) {
        currentEntry.trailingLines.add(line);
      }
      continue;
    }

    final indent = line.indexOf(line.trim());
    if (indent == 2) {
      final name = line.trim().split(':').first;
      currentEntry = _DependencyEntry(name, [line]);
      entries.add(currentEntry);
    } else if (currentEntry != null) {
      currentEntry.lines.add(line);
    }
  }

  entries.sort((a, b) => a.name.compareTo(b.name));

  final result = <String>[];
  for (final entry in entries) {
    result
      ..addAll(entry.lines)
      ..addAll(entry.trailingLines);
  }
  return result;
}

class _DependencyEntry {
  _DependencyEntry(this.name, this.lines);
  final String name;
  final List<String> lines;
  final List<String> trailingLines = [];
}
