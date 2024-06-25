import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo_test/Controllers/SharedPreferencesController.dart';

class LoginViewModel extends GetxController {
  var _prefs = Get.find<SharedPreferencesController>();
  var _emailcontroller = TextEditingController().obs;
  var _passwordController = TextEditingController().obs;

  //getter for email controller
  Rx<TextEditingController> get emailController => _emailcontroller;

  //getter for Password
  Rx<TextEditingController> get passwordController => _passwordController;

  @override
  void onInit() {
    super.onInit();
  }

  //verify password & email from the SharedPreferences
  void verifyUser() {
    //verify email and password
    _prefs.verifyUser(
        _emailcontroller.value.text, _passwordController.value.text);
  }
}
