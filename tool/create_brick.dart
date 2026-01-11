import 'dart:io';

// import 'package:flutter_base_core/flutter_base_core.dart'; // Flutter paketi CLI'da çalışmaz

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

  // Hedef klasör varsa temizle (HELLLO.md vs silinsin)
  if (targetDir.existsSync()) {
    targetDir.deleteSync(recursive: true);
  }
  targetDir.createSync(recursive: true);

  await _copyAndTemplatize(currentDir, targetDir);

  logger
    ..info('✅ İşlem tamamlandı! Brick kullanıma hazır.')
    ..info('👉 Kullanım: mason make project_starter_brick --name my_new_app');
}

Future<void> _copyAndTemplatize(Directory source, Directory destination) async {
  await for (final entity in source.list(followLinks: false)) {
    final entityName = entity.uri.pathSegments.where((e) => e.isNotEmpty).last;

    // Yoksayılanları atla
    if (ignoredPaths.contains(entityName) || entityName.startsWith('.')) {
      continue;
    }

    // Recursion önleme: Hedef klasörün kendisini kopyalamaya çalışma
    // canonicalPath kullanarak sembolik linkleri vs çözmek daha garantidir ama
    // basitçe path kontrolü yapalım.
    if (entity.path.contains('mason/bricks/project_starter_brick')) {
      continue;
    }

    // Mason klasörünü de kopyalamayalım (içinde bricks var, recursion olabilir)
    if (entityName == 'mason') {
      continue;
    }

    // Dosya/Klasör isminde proje adı varsa onu {{name}} değişkenine çevir
    // Örneğin: flutter_base -> {{name.snakeCase()}}
    final newName = entityName.replaceAll(originalProjectName, '{{name.snakeCase()}}');
    final newPath = '${destination.path}/$newName';

    try {
      if (entity is Directory) {
        // Klasörü açıkça oluştur (Boş klasörlerin de kopyalanması için)
        Directory(newPath).createSync(recursive: true);
        await _copyAndTemplatize(entity, Directory(newPath));
      } else if (entity is File) {
        await _processFile(entity, File(newPath));
      }
    } catch (e, st) {
      logger.error('❌ Error processing ${entity.path}: $e', error: e, stackTrace: st);
    }
  }
}

Future<void> _processFile(File sourceFile, File targetFile) async {
  // Binary dosyaları (resim, font vb.) direkt kopyala
  if (_isBinary(sourceFile.path)) {
    targetFile.createSync(recursive: true);
    await sourceFile.copy(targetFile.path);
    return;
  }

  try {
    var content = await sourceFile.readAsString();

    // İçerikteki değişiklikleri yap
    // 1. Proje adı (snake_case) -> flutter_base -> {{name.snakeCase()}}
    content = content.replaceAll('flutter_base', '{{name.snakeCase()}}');

    // 2. Proje başlığı (Title Case) -> Flutter Base -> {{name.titleCase()}}
    // Basit bir replace yapıyoruz, case-sensitive dikkat
    content = content.replaceAll('Flutter Base', '{{name.titleCase()}}');

    // 3. Bundle ID vb. için eklenebilir. Şimdilik 'flutter_base' yeterli.

    // Hedef dosyayı oluştur ve yaz
    targetFile.createSync(recursive: true);
    await targetFile.writeAsString(content);
  } catch (e) {
    // Okuma hatası olursa (bazen UTF-8 olmayan text dosyaları olabilir), binary gibi kopyala
    logger.warn('⚠️ Binary olarak kopyalanıyor: ${sourceFile.path}');
    targetFile.createSync(recursive: true);
    await sourceFile.copy(targetFile.path);
  }
}

bool _isBinary(String path) {
  final ext = path.split('.').last.toLowerCase();
  return ['png', 'jpg', 'jpeg', 'gif', 'ico', 'webp', 'ttf', 'otf', 'pdf', 'jar', 'keystore', 'jks', 'svg']
      .contains(ext);
}
