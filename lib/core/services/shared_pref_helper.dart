import '../../../../../core/common/shared/shared_imports.dart'; //

import 'package:encrypt/encrypt.dart' as encrypt;

class SharedPrefHelper {
  factory SharedPrefHelper() {
    return preferences;
  }

  SharedPrefHelper._internal();

  static final SharedPrefHelper preferences = SharedPrefHelper._internal();

  static late SharedPreferences sharedPreferences;
  static late FlutterSecureStorage flutterSecureStorage;

  static final _key = encrypt.Key.fromUtf8(
      'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb'); // 32-character key
  static final _iv = encrypt.IV.fromLength(16); // 16-byte initialization vector

  static final _encrypter = encrypt.Encrypter(encrypt.AES(_key));

  ///Below method is to initialize the SharedPreference instance.
  static Future<dynamic> getInstancePreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    flutterSecureStorage = const FlutterSecureStorage();
  }

  /// Removes a value from SharedPreferences with the given [key].
  static Future<void> removeData(String key) async {
    debugPrint('SharedPrefHelper: Removing data with key: $key');
    await sharedPreferences.remove(key);
  }

  /// Removes all keys and values from SharedPreferences.
  static Future<void> clearAllData() async {
    debugPrint('SharedPrefHelper: Clearing all data');
    await sharedPreferences.clear();
  }

  /// Saves a [value] with a [key] in SharedPreferences.
  static Future<void> setData(String key, dynamic value) async {
    debugPrint(
        "SharedPrefHelper: Setting data with key: $key and value: $value");
    if (value is String) {
      final encrypted = _encrypter.encrypt(value, iv: _iv);
      debugPrint("Encrypted data: ${encrypted.base64}");
      await sharedPreferences.setString(key, encrypted.base64);
    } else if (value is int) {
      await sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      await sharedPreferences.setBool(key, value);
    } else if (value is double) {
      await sharedPreferences.setDouble(key, value);
    } else {
      throw ArgumentError('Unsupported value type');
    }
  }

  /// Gets a bool value from SharedPreferences with the given [key].
  static bool getBool(String key) {
    debugPrint('SharedPrefHelper: Getting bool with key: $key');

    return sharedPreferences.getBool(key) ?? false;
  }

  /// Gets a double value from SharedPreferences with the given [key].
  static double getDouble(String key) {
    debugPrint('SharedPrefHelper: Getting double with key: $key');

    return sharedPreferences.getDouble(key) ?? 0.0;
  }

  /// Gets an int value from SharedPreferences with the given [key].
  static int getInt(String key) {
    debugPrint('SharedPrefHelper: Getting int with key: $key');

    return sharedPreferences.getInt(key) ?? 0;
  }

  /// Gets a String value from SharedPreferences with the given [key].
  static String getString(String key) {
    debugPrint('SharedPrefHelper: Getting string with key: $key');

    final encryptedBase64 = sharedPreferences.getString(key);
    if (encryptedBase64 != null) {
      debugPrint("Encrypted base64: $encryptedBase64");
      final encryptedData = encrypt.Encrypted.fromBase64(encryptedBase64);
      final decrypted = _encrypter.decrypt(encryptedData, iv: _iv);
      debugPrint("Decrypted value: $decrypted");
      return decrypted;
    }
    return '';
  }

  /// Saves a [value] with a [key] in FlutterSecureStorage.
  static Future<void> setSecuredString(String key, String value) async {
    debugPrint(
        'FlutterSecureStorage: Setting secured string with key: $key and value: $value');
    await flutterSecureStorage.write(key: key, value: value);
  }

  /// Gets a String value from FlutterSecureStorage with the given [key].
  static Future<String> getSecuredString(String key) async {
    debugPrint('FlutterSecureStorage: Getting secured string with key: $key');
    return await flutterSecureStorage.read(key: key) ?? '';
  }

  /// Removes all keys and values from FlutterSecureStorage.
  static Future<void> clearAllSecuredData() async {
    debugPrint('FlutterSecureStorage: Clearing all secured data');
    await flutterSecureStorage.deleteAll();
  }

  ///Below method is to check the availability of the received preference .
  static bool containPreference(String key) {
    if (sharedPreferences.get(key) == null) {
      return false;
    } else {
      return true;
    }
  }
}
