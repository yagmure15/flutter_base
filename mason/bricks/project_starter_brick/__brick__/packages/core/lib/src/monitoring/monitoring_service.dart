import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

import '../logger/log_it.dart';

abstract interface class MonitoringService {
  Future<void> initialize();

  Future<void> logEvent({
    required String name,
    Map<String, Object?>? parameters,
  });

  Future<void> setUserIdentifier(String userId);

  Future<void> recordError(
    dynamic exception,
    StackTrace? stack, {
    dynamic reason,
    bool fatal = false,
  });

  Future<void> recordFlutterError(FlutterErrorDetails details);
}

/// Firebase-backed [MonitoringService] (Analytics + Crashlytics).
///
/// Registered by `CoreModule` only when a Firebase app has been initialized;
/// otherwise [LoggerMonitoringService] is used so the app can still boot
/// before `flutterfire configure` has been run.
class FirebaseMonitoringService implements MonitoringService {
  FirebaseMonitoringService(this._analytics, this._crashlytics);

  final FirebaseAnalytics _analytics;
  final FirebaseCrashlytics _crashlytics;

  @override
  Future<void> initialize() async {
    await _crashlytics.setCrashlyticsCollectionEnabled(!kDebugMode);
    await _analytics.setAnalyticsCollectionEnabled(!kDebugMode);
  }

  @override
  Future<void> logEvent({
    required String name,
    Map<String, Object?>? parameters,
  }) async {
    Map<String, Object>? sanitizedParameters;
    if (parameters != null) {
      sanitizedParameters = {};
      for (final entry in parameters.entries) {
        if (entry.value != null) {
          sanitizedParameters[entry.key] = entry.value!;
        }
      }
    }

    await _analytics.logEvent(name: name, parameters: sanitizedParameters);
  }

  @override
  Future<void> setUserIdentifier(String userId) async {
    await _analytics.setUserId(id: userId);
    await _crashlytics.setUserIdentifier(userId);
  }

  @override
  Future<void> recordError(
    dynamic exception,
    StackTrace? stack, {
    dynamic reason,
    bool fatal = false,
  }) async {
    await _crashlytics.recordError(
      exception,
      stack,
      reason: reason,
      fatal: fatal,
    );
  }

  @override
  Future<void> recordFlutterError(FlutterErrorDetails details) async {
    await _crashlytics.recordFlutterError(details);
  }
}

/// Console-only [MonitoringService] used when Firebase is not configured
/// (and a convenient default for tests).
class LoggerMonitoringService implements MonitoringService {
  const LoggerMonitoringService();

  @override
  Future<void> initialize() async {
    logger.warn(
      'Firebase is not configured; monitoring events are only logged to the console.',
    );
  }

  @override
  Future<void> logEvent({
    required String name,
    Map<String, Object?>? parameters,
  }) async {
    logger.info('[analytics] $name ${parameters ?? ''}');
  }

  @override
  Future<void> setUserIdentifier(String userId) async {
    logger.info('[analytics] user id set: $userId');
  }

  @override
  Future<void> recordError(
    dynamic exception,
    StackTrace? stack, {
    dynamic reason,
    bool fatal = false,
  }) async {
    logger.error(
      '[crashlytics] ${fatal ? 'FATAL ' : ''}${reason ?? ''}',
      error: exception,
      stackTrace: stack,
    );
  }

  @override
  Future<void> recordFlutterError(FlutterErrorDetails details) async {
    logger.error(
      '[crashlytics] ${details.exceptionAsString()}',
      error: details.exception,
      stackTrace: details.stack,
    );
  }
}
