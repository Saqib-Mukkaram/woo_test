import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo_test/CustomWidgets/InputField.dart';
import 'package:woo_test/ViewModels/LoginViewModel.dart';
import 'package:woo_test/Views/Register/Register.dart';

import '../../Controllers/AuthController.dart';
import '../Home.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _viewModel = Get.find<LoginViewModel>();
  var _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Get.back();
        },
      )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                "Welcome\nBack!",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            InputField(
              placeholderText: "Email ",
              fieldController: _viewModel.emailController.value,
            ),
            SizedBox(
              height: 20,
            ),
            InputField(
              placeholderText: "Password",
              fieldController: _viewModel.passwordController.value,
              obscureText: true,
              // suffixIcon: Icon(Icons.visibility),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: Colors.blueAccent,
                      backgroundColor: Colors.white),
                  onPressed: () {},
                  child: Text("Forget Password?"),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      surfaceTintColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      fixedSize: Size(200, 60),
                      elevation: 0,
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue),
                  onPressed: () {
                    _authController
                        .loginUser(_viewModel.emailController.value.text,
                            _viewModel.passwordController.value.text)
                        .then((v) {
                      if (v) {
                        Get.offAll(HomeScreen());
                      } else {
                        Get.defaultDialog(
                          title: "Error",
                          middleText: "Invalid Email or Password",
                        );
                      }
                    });
                  },
                  child: Text(
                    "Login",
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                    onPressed: () {
                      Get.to(
                        RegisterScreen(),
                      );
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
