import 'package:shared_preferences/shared_preferences.dart';
import 'local_storage_service.dart';

class SharedPreferencesService implements ILocalStorageService {
  final SharedPreferences _prefs;

  SharedPreferencesService(this._prefs);

  @override
  bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }

  @override
  Future<void> setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  @override
  String getString(String key) {
    return _prefs.getString(key) ?? '';
  }

  @override
  Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  @override
  List<String> getStringList(String key) {
    return _prefs.getStringList(key) ?? [];
  }

  @override
  Future<void> setStringList(String key, List<String> value) async {
    await _prefs.setStringList(key, value);
  }
}