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

  //setter for string
  void setString(String key, String value) {
    _prefs.setString(key, value);
  }
  //setter for int
  void setInt(String key, int value) {
    _prefs.setInt(key, value);
  }
  //setter for double
  void setDouble(String key, double value) {
    _prefs.setDouble(key, value);
  }
  //setter for bool
  void setBool(String key, bool value) {
    _prefs.setBool(key, value);
  }
  //setter for List<String>
  void setStringList(String key, List<String> value) {
    _prefs.setStringList(key, value);
  }

  // getter
  String? getString(String key) {
    return _prefs.getString(key);
  }
  // getter int
  int? getInt(String key) {
    return _prefs.getInt(key);
  }
  // getter double
  double? getDouble(String key) {
    return _prefs.getDouble(key);
  }
  // getter bool
  bool? getBool(String key) {
    return _prefs.getBool(key);
  }
  // getter List<String>
  List<String>? getStringList(String key) {
    return _prefs.getStringList(key);
  }


}
