import 'dart:io';

// Basit bir logger sınıfı tanımlayalım
class Logger {
  void info(String message) => stdout.writeln(message);
  void warn(String message) => stdout.writeln('[WARN] $message');
  void error(String message, {Object? error, StackTrace? stackTrace}) {
    stderr.writeln('[ERROR] $message');
    if (error != null) stderr.writeln(error);
    if (stackTrace != null) stderr.writeln(stackTrace);
  }
}

final logger = Logger();

// Konfigürasyon
const String originalProjectName = 'flutter_base';
const String targetBrickPath = 'mason/bricks/project_starter_brick/__brick__';

// Yoksayılacak dosya ve klasörler
const Set<String> ignoredPaths = {
  '.git',
  '.dart_tool',
  '.idea',
  '.vscode',
  'build',
  'ios/Pods',
  'macos/Pods',
  '.fvm',
  'pubspec.lock',
  'mason-lock.json',
  'coverage',
  'tool', // Kendi çalıştırdığımız scripti kopyalamayalım
  'mason/bricks/project_starter_brick', // Hedef klasörü tekrar kopyalamayalım
};

void main() async {
  final currentDir = Directory.current;
  final targetDir = Directory(targetBrickPath);

  logger
    ..info('🚀 Brick oluşturma işlemi başladı...')
    ..info('📂 Kaynak: ${currentDir.path}')
    ..info('🎯 Hedef: ${targetDir.path}');

  // Hedef klasör varsa temizle
  if (targetDir.existsSync()) {
    targetDir.deleteSync(recursive: true);
  }
  targetDir.createSync(recursive: true);

  await _copyAndTemplatize(currentDir, targetDir);

  // .env dosyalarını oluştur (dot.env formatında kopyalanması için)
  logger.info('📝 .env dosyaları oluşturuluyor...');
  final envPath = '${targetDir.path}/apps/client';

  // Mason '.' ile başlayan dosyaları bazen atlayabiliyor, o yüzden 'dot.' öneki kullanıyoruz
  // post_gen hook'unda bunları geri çevireceğiz.
  File('$envPath/dot.env.dev')
      .writeAsStringSync('BASE_URL=https://dev.api.example.com\nKEY=dev_key');
  File('$envPath/dot.env.staging').writeAsStringSync(
    'BASE_URL=https://staging.api.example.com\nKEY=staging_key',
  );
  File('$envPath/dot.env.prod')
      .writeAsStringSync('BASE_URL=https://api.example.com\nKEY=prod_key');

  // .fvmrc dosyasını da 'dot.' önekiyle kopyala; post_gen hook'u geri çevirir.
  // Böylece üretilen proje, şablonla aynı Flutter SDK sürümüne sabitlenir.
  final fvmrc = File('.fvmrc');
  if (fvmrc.existsSync()) {
    logger.info('📌 .fvmrc kopyalanıyor (dot.fvmrc)...');
    fvmrc.copySync('${targetDir.path}/dot.fvmrc');
  }

  logger
    ..info('✅ İşlem tamamlandı! Brick kullanıma hazır.')
    ..info('👉 Kullanım: mason make project_starter_brick --name my_new_app');
}

Future<void> _copyAndTemplatize(Directory source, Directory destination) async {
  await for (final entity in source.list(followLinks: false)) {
    final entityName = entity.uri.pathSegments.where((e) => e.isNotEmpty).last;
    // 'ios/Pods' gibi iç içe yolları da eşleştirebilmek için "ebeveyn/ad" formu
    final parentSegments = entity.parent.uri.pathSegments
        .where((e) => e.isNotEmpty)
        .toList();
    final nestedName = parentSegments.isEmpty
        ? entityName
        : '${parentSegments.last}/$entityName';

    // Yoksayılanları atla
    if (ignoredPaths.contains(entityName) ||
        ignoredPaths.contains(nestedName) ||
        entityName.startsWith('.')) {
      continue;
    }

    if (entity.path.contains('mason/bricks/project_starter_brick')) {
      continue;
    }

    // Mason klasörünü de kopyalamayalım
    if (entityName == 'mason') {
      continue;
    }

    // Dosya/Klasör isminde proje adı varsa onu {{name}} değişkenine çevir
    final newName = entityName.replaceAll(
      originalProjectName,
      '{{name.snakeCase()}}',
    );
    final newPath = '${destination.path}/$newName';

    try {
      if (entity is Directory) {
        final newDir = Directory(newPath)..createSync(recursive: true);

        // Eğer assets klasörü ise ve boşsa içine .gitkeep koy
        if (newDir.path.contains('assets') && newDir.listSync().isEmpty) {
          File('${newDir.path}/.gitkeep').createSync();
        }

        await _copyAndTemplatize(entity, newDir);
      } else if (entity is File) {
        await _processFile(entity, File(newPath));
      }
    } catch (e, st) {
      logger.error(
        '❌ Error processing ${entity.path}: $e',
        error: e,
        stackTrace: st,
      );
    }
  }
}

Future<void> _processFile(File sourceFile, File targetFile) async {
  if (_isBinary(sourceFile.path)) {
    targetFile.createSync(recursive: true);
    await sourceFile.copy(targetFile.path);
    return;
  }

  try {
    var content = await sourceFile.readAsString();

    // İçerikteki değişiklikleri yap
    content = content.replaceAll('flutter_base', '{{name.snakeCase()}}');
    content = content.replaceAll('Flutter Base', '{{name.titleCase()}}');

    targetFile.createSync(recursive: true);
    await targetFile.writeAsString(content);
  } catch (e) {
    logger.warn('⚠️ Binary olarak kopyalanıyor: ${sourceFile.path}');
    targetFile.createSync(recursive: true);
    await sourceFile.copy(targetFile.path);
  }
}

bool _isBinary(String path) {
  final ext = path.split('.').last.toLowerCase();
  return [
    'png',
    'jpg',
    'jpeg',
    'gif',
    'ico',
    'webp',
    'ttf',
    'otf',
    'pdf',
    'jar',
    'keystore',
    'jks',
    'svg',
  ].contains(ext);
}
