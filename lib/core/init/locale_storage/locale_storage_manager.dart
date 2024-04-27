import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageManager {
  LocalStorageManager._();

  static const _iosOptions =
      IOSOptions(accessibility: KeychainAccessibility.first_unlock);
  static const _androidOptions =
      AndroidOptions(encryptedSharedPreferences: true);

  static const FlutterSecureStorage _secureStorage =
      FlutterSecureStorage(iOptions: _iosOptions, aOptions: _androidOptions);

  static Future<Set<String>?> getKeys() async => (await _secureStorage.readAll(
          /*Options: _androidOptions*/ /*Options: _iosOptions*/))
      .keys
      .toSet();

  static Future<bool> containsKey(String key) async =>
      await _secureStorage.containsKey(
        key: key, /*Options: _androidOptions*/ /*Options: _iosOptions*/
      );

  static Future<void> setString(String key, String value) async =>
      await _secureStorage.write(
        key: key,
        value: value,
        /*Options: _androidOptions*/
        /*Options: _iosOptions*/
      );

  static Future<void> setBool(String key, bool value) async =>
      await _secureStorage.write(
        key: key,
        value: value.toString(),
        /*Options: _androidOptions*/
        /*Options: _iosOptions*/
      );

  static Future<void> setNum(String key, num value) async =>
      await _secureStorage.write(
        key: key,
        value: value.toString(),
        /*Options: _androidOptions*/
        /*Options: _iosOptions*/
      );

  static Future<void> _setList<T>(String key, List<T> value) async {
    String buffer = json.encode(value);
    await _secureStorage.write(
      key: key,
      value: buffer,
      /*Options: _androidOptions*/
      /*Options: _iosOptions*/
    );
  }

  static Future<void> _setMap(String key, Map<String, int> value) async {
    String buffer = json.encode(value);
    await _secureStorage.write(
      key: key,
      value: buffer,
      /*Options: _androidOptions*/
      /*Options: _iosOptions*/
    );
  }

  static Future<void> setMap(String key, Map<String, int> value) =>
      _setMap(key, value);

  static Future<void> setStringList(String key, List<String> value) =>
      _setList<String>(key, value);

  static Future<void> setNumList(String key, List<num> value) =>
      _setList<num>(key, value);

  static Future<void> setBoolList(String key, List<bool> value) =>
      _setList<bool>(key, value);

  static Future<String?> getString(String key) async =>
      await _secureStorage.read(
        key: key, /*Options: _androidOptions*/ /*Options: _iosOptions*/
      );

  static Future<bool?> getBool(String key) async {
    String? string = await _secureStorage.read(
      key: key, /*Options: _androidOptions*/ /*Options: _iosOptions*/
    );
    if (string == null) return null;
    if (string == 'true') {
      return true;
    } else if (string == 'false') {
      return false;
    } else {
      return null;
    }
  }

  static Future<num?> getNum(String key) async =>
      num.tryParse(await _secureStorage.read(
            key: key, /*Options: _androidOptions*/ /*Options: _iosOptions*/
          ) ??
          '');

  static Future<List<T>?> _getList<T>(String key) async {
    String? string = await _secureStorage.read(
      key: key, /*Options: _androidOptions*/ /*Options: _iosOptions*/
    );
    if (string == null) return null;
    List<T> list = (json.decode(string) as List).cast<T>();
    return list;
  }

  static Future<Map<String, int>?> _getMap(String key) async {
    String? string = await _secureStorage.read(
      key: key, /*Options: _androidOptions*/ /*Options: _iosOptions*/
    );
    if (string == null) return null;
    Map<String, int>? map =
        (json.decode(string) as Map<String, dynamic>?)?.cast();
    return map;
  }

  static Future<Map<String, int>?> getMap(String key) => _getMap(key);

  static Future<List<String>?> getStringList(String key) =>
      _getList<String>(key);

  static Future<List<num>?> getNumList(String key) => _getList<num>(key);

  static Future<List<bool>?> getBoolList(String key) => _getList<bool>(key);

  static Future<void> remove(String key) async => await _secureStorage.delete(
        key: key, /*Options: _androidOptions*/ /*Options: _iosOptions*/
      );

  static Future<void> clearAll() async => await _secureStorage.deleteAll(
      /*Options: _androidOptions*/ /*Options: _iosOptions*/);
  static Future<void> clearMap() async {
    var map = await LocalStorageManager.getMap("projectWorkTime");

    map?.clear();
    LocalStorageManager.setMap("projectWorkTime", map!);
  }

  static Future<void> updateMap(String key, int value) async {
    var map = await LocalStorageManager.getMap("projectWorkTime");
    map?.update(key, (val) => value);

    LocalStorageManager.setMap("projectWorkTime", map!);
  }
}

enum LocalStorage { token, login, userId, introOff }

extension LocalStorageExtension on LocalStorage {
  String get key {
    switch (this) {
      case LocalStorage.token:
        return 'token';
      case LocalStorage.login:
        return 'login';
      case LocalStorage.userId:
        return 'userId';
      case LocalStorage.introOff:
        return 'introOff';
    }
  }
}