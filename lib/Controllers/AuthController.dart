import 'dart:convert';

import 'package:get/get.dart';
import 'package:woo_test/Controllers/SharedPreferencesController.dart';
import 'package:woo_test/Models/User.dart';
import 'package:woo_test/Views/Home.dart';
import 'package:woo_test/data/API.dart';

class AuthController extends GetxController {
  var _isLogged = false.obs;

  //getter for isLogged
  bool get isLogged => _isLogged.value;

  //setter for isLogged
  set isLogged(bool value) => _isLogged.value = value;

  //function to login
  void login() {
    isLogged = true;
  }

  //function to logout
  void logout() {
    isLogged = false;
  }

  Future<bool> registerUser(User user) async {
    // Register the User with the Woocommerce
    await ApiClient.post("wp-json/wc/v3/customers", user.toJson())
        .then((v) async {
      var result = jsonDecode(v.body);
      print(result);
      var _prefs = Get.find<SharedPreferencesController>();
      _prefs.setString('user_id', result['id']);
      Get.defaultDialog(
          title: 'User Registered', middleText: 'User Registered Successfully');

      return true;
    });
    return false;
  }

  Future<bool> loginUser(String email, String password) async {
    // Register the User with the Woocommerce

    var _prefs = Get.find<SharedPreferencesController>();
    var userId = _prefs.getString('user_id');
    if (userId != null) {
      ApiClient.get("wp-json/wc/v3/customers/$userId").then((v) async {
        var result = jsonDecode(v.body);
        print(result);
        var user = User.fromJson(result);
        print(user);

        return true;
      });
      Get.offAll(HomeScreen());
      return true;
    }
    return false;
  }
}
