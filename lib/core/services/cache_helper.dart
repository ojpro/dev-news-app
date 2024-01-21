import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future put(String key, dynamic value) async {
    await sharedPreferences?.setString(key, value);
  }

  static Future putInit(String key, dynamic value) async {
    await sharedPreferences?.setInt(key, value);
  }

  static Future putBool(String key, dynamic value) async {
    await sharedPreferences?.setBool(key, value);
  }

  static Object? get(String key) {
    return sharedPreferences?.get(key) as String?;
  }

  static bool? getBool(String key){
    return sharedPreferences?.getBool(key);
  }
}
