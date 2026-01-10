import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseModule {
  @lazySingleton
  FirebaseAnalytics get analytics => FirebaseAnalytics.instance;

  @lazySingleton
  FirebaseCrashlytics get crashlytics => FirebaseCrashlytics.instance;
}
