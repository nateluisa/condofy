abstract class ILocalStorageService {
  Future<void> setBool(String key, bool value);
  bool getBool(String key);

  Future<void> setString(String key, String value);
  String getString(String key);

  Future<void> setStringList(String key, List<String> value);
  List<String> getStringList(String key);
}