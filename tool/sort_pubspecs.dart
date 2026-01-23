import 'dart:io';

void main() {
  final directory = Directory.current;
  sortAllPubspecs(directory);
}

void sortAllPubspecs(Directory directory) {
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
          // End of block
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
    // A new dependency entry starts if indent is exactly 2 (or more than 0 but less than others)
    // In pubspec, dependencies are usually indented by 2.
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
