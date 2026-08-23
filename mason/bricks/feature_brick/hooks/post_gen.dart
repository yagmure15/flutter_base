import 'dart:io';

import 'package:mason/mason.dart';
import 'package:path/path.dart' as p;

/// Wires the generated feature into the app:
///  * adds the page import + `AutoRoute(...)` entry to `core/router/app_router.dart`
///  * reminds the developer to run code generation (DI/router/freezed/slang).
///
/// Expected usage:
/// `mason make feature_brick --name <name> -o apps/client/lib/features`
/// (the hook runs inside the output directory).
void run(HookContext context) {
  final name = context.vars['name'] as String;
  final snake = name.snakeCase;
  final pascal = name.pascalCase;
  final camel = name.camelCase;

  final outputDir = Directory.current;
  final pageFile = File(
    p.join(
      outputDir.path,
      snake,
      'presentation',
      'pages',
      '${snake}_page.dart',
    ),
  );
  final routerFile = _findRouterFile(outputDir);

  if (routerFile == null || !pageFile.existsSync()) {
    context.logger.warn(
      'core/router/app_router.dart not found. Register ${pascal}Route manually.',
    );
  } else {
    _registerRoute(
      context: context,
      routerFile: routerFile,
      pageFile: pageFile,
      pascal: pascal,
    );
  }

  context.logger
    ..info('')
    ..info('Next steps:')
    ..info('  1. melos run gen   (DI, router, freezed, slang)')
    ..info('  2. Review the generated route in core/router/app_router.dart')
    ..info('  3. Edit presentation/translations/${camel}_*.i18n.json');
}

/// Walks up from [start] looking for `core/router/app_router.dart`.
File? _findRouterFile(Directory start) {
  var dir = start;
  for (var i = 0; i < 6; i++) {
    final candidate = File(
      p.join(dir.path, 'core', 'router', 'app_router.dart'),
    );
    if (candidate.existsSync()) return candidate;
    final parent = dir.parent;
    if (parent.path == dir.path) break;
    dir = parent;
  }
  return null;
}

void _registerRoute({
  required HookContext context,
  required File routerFile,
  required File pageFile,
  required String pascal,
}) {
  final lines = routerFile.readAsLinesSync();
  final relativeImport = p
      .relative(pageFile.path, from: routerFile.parent.path)
      .replaceAll(r'\', '/');
  final importLine = "import '$relativeImport';";
  final routeLine = 'AutoRoute(page: ${pascal}Route.page),';

  final alreadyImported = lines.any((l) => l.trim() == importLine);
  final alreadyRouted = lines.any((l) => l.contains('${pascal}Route.page'));
  if (alreadyImported && alreadyRouted) {
    context.logger.info(
      '${pascal}Route is already registered in app_router.dart',
    );
    return;
  }

  if (!alreadyImported) {
    // Keep relative imports grouped: insert after the last relative import,
    // otherwise after the last import of any kind.
    var index = lines.lastIndexWhere(
      (l) => l.startsWith("import '../") || l.startsWith("import './"),
    );
    if (index == -1) {
      index = lines.lastIndexWhere((l) => l.startsWith('import '));
    }
    if (index == -1) {
      context.logger.warn(
        'No import section found in app_router.dart; add manually: '
        '$importLine',
      );
    } else {
      lines.insert(index + 1, importLine);
    }
  }

  if (!alreadyRouted) {
    final routesStart = lines.indexWhere((l) => l.contains('get routes =>'));
    final routesEnd = routesStart == -1
        ? -1
        : lines.indexWhere((l) => l.trim() == '];', routesStart);
    if (routesStart == -1 || routesEnd == -1) {
      context.logger.warn(
        'No `routes` getter found in app_router.dart; add manually: '
        '$routeLine',
      );
    } else {
      lines.insert(routesEnd, '    $routeLine');
    }
  }

  routerFile.writeAsStringSync('${lines.join('\n')}\n');
  context.logger.success(
    'Registered ${pascal}Route in '
    '${p.relative(routerFile.path, from: Directory.current.path)}',
  );
}
