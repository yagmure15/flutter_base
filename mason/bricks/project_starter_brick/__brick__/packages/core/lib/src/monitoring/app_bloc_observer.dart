import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logger/log_it.dart';
import '../monitoring/monitoring_service.dart';

class AppBlocObserver extends BlocObserver {
  AppBlocObserver(this._monitoringService) : super();

  final MonitoringService _monitoringService;

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    if (kDebugMode) {
      logger.info('onCreate -- ${bloc.runtimeType}');
    }
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    if (kDebugMode) {
      logger.info('onEvent -- ${bloc.runtimeType}, $event');
    }
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      logger.info('onChange -- ${bloc.runtimeType}, ${change.nextState}');
    }
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);

    if (kDebugMode) {
      logger.error('onError -- ${bloc.runtimeType}, $error');
    } else {
      _monitoringService.recordError(
        error,
        stackTrace,
        reason: 'Bloc Error: ${bloc.runtimeType}',
      );
    }
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    if (kDebugMode) {
      logger.info('onClose -- ${bloc.runtimeType}');
    }
  }
}
