import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesController extends GetxController {
  late SharedPreferences _prefs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    _prefs = await SharedPreferences.getInstance();
  }

  //getter for SharedPreferences
  SharedPreferences get prefs => _prefs;

  //setter for SharedPreferences
  void setPrefs(String key, dynamic value) {
    if (value is String) {
      _prefs.setString(key, value);
    } else if (value is int) {
      _prefs.setInt(key, value);
    } else if (value is bool) {
      _prefs.setBool(key, value);
    } else if (value is double) {
      _prefs.setDouble(key, value);
    } else if (value is List<String>) {
      _prefs.setStringList(key, value);
    }
  }

  // Get Prefs
  dynamic getPrefs(String key) {
    return _prefs.get(key);
  }
}
