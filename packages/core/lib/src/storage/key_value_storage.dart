import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

/// Interface for key-value storage operations.
/// This allows us to mock storage in tests or switch implementations (e.g. Hive) easily.
abstract class KeyValueStorage {
  Future<void> init();

  String? getString(String key);
  Future<void> setString(String key, String value);

  bool? getBool(String key);
  Future<void> setBool(String key, {required bool value});

  int? getInt(String key);
  Future<void> setInt(String key, int value);

  double? getDouble(String key);
  Future<void> setDouble(String key, double value);

  List<String>? getStringList(String key);
  Future<void> setStringList(String key, List<String> value);

  Future<void> remove(String key);
  Future<void> clear();
}

/// Implementation using SharedPreferences
class KeyValueStorageImpl implements KeyValueStorage {
  SharedPreferences? _prefs;

  @override
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  SharedPreferences get _checkPrefs {
    if (_prefs == null) {
      throw Exception('KeyValueStorage not initialized. Call init() first.');
    }
    return _prefs!;
  }

  @override
  String? getString(String key) => _checkPrefs.getString(key);

  @override
  Future<void> setString(String key, String value) =>
      _checkPrefs.setString(key, value);

  @override
  bool? getBool(String key) => _checkPrefs.getBool(key);

  @override
  Future<void> setBool(String key, {required bool value}) =>
      _checkPrefs.setBool(key, value);

  @override
  int? getInt(String key) => _checkPrefs.getInt(key);

  @override
  Future<void> setInt(String key, int value) => _checkPrefs.setInt(key, value);

  @override
  double? getDouble(String key) => _checkPrefs.getDouble(key);

  @override
  Future<void> setDouble(String key, double value) =>
      _checkPrefs.setDouble(key, value);

  @override
  List<String>? getStringList(String key) => _checkPrefs.getStringList(key);

  @override
  Future<void> setStringList(String key, List<String> value) =>
      _checkPrefs.setStringList(key, value);

  @override
  Future<void> remove(String key) => _checkPrefs.remove(key);

  @override
  Future<void> clear() => _checkPrefs.clear();
}
