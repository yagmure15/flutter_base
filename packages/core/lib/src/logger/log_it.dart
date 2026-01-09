import 'package:logger/logger.dart';

final LogIt logger = LogIt();

class LogIt {
  final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      levelColors: {
        Level.warning: const AnsiColor.fg(208),
        Level.debug: const AnsiColor.fg(245),
        Level.info: const AnsiColor.fg(116),
        Level.error: const AnsiColor.fg(196),
        Level.fatal: const AnsiColor.fg(196),
        Level.trace: const AnsiColor.fg(199),
      },
      levelEmojis: {
        Level.warning: '⚠️',
        Level.debug: '🐛',
        Level.info: 'ℹ️',
        Level.error: '❌',
        Level.fatal: '🚨',
        Level.trace: '🤬',
      },
    ),
  );

  /// Log a message at level [Level.trace].
  void trace(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.t(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.debug].
  void debug(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.d(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.info].
  void info(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.i(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.warning].
  void warn(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.w(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.error].
  void error(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.fatal].
  void fatal(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.f(message, error: error, stackTrace: stackTrace);
  }
}
