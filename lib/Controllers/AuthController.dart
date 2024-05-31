import 'package:get/get.dart';

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
}
