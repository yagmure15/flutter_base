import 'package:permission_handler/permission_handler.dart';

/// Service to handle device permissions.
/// Abstraction over permission_handler to make it testable and centralized.
class PermissionService {
  /// Request a specific permission.
  Future<bool> requestPermission(Permission permission) async {
    final status = await permission.request();
    return status.isGranted;
  }

  /// Check status of a permission.
  Future<PermissionStatus> checkStatus(Permission permission) {
    return permission.status;
  }

  /// Open app settings if permission is permanently denied.
  Future<bool> openSettings() {
    return openAppSettings();
  }
}
