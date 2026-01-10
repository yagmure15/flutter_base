import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

/// Service to monitor network connectivity status.
class ConnectivityService {
  ConnectivityService({Connectivity? connectivity}) : _connectivity = connectivity ?? Connectivity();
  final Connectivity _connectivity;

  /// Stream of connectivity changes.
  Stream<List<ConnectivityResult>> get onConnectivityChanged => _connectivity.onConnectivityChanged;

  /// Check current connectivity status.
  Future<List<ConnectivityResult>> checkConnectivity() => _connectivity.checkConnectivity();

  /// Helper to check if there is basically any connection (mobile, wifi, ethernet, vpn).
  /// Note: This doesn't guarantee internet access, just network connection.
  Future<bool> get hasConnection async {
    final result = await checkConnectivity();
    return !result.contains(ConnectivityResult.none);
  }
}
