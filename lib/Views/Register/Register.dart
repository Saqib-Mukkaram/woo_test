import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo_test/Controllers/AuthController.dart';
import 'package:woo_test/CustomWidgets/InputField.dart';
import 'package:woo_test/Models/User.dart';
import 'package:woo_test/ViewModels/RegisterViewModel.dart';
import 'package:woo_test/Views/Login/Login.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  var registerController = Get.find<RegisterViewModel>();
  var authController = Get.find<AuthController>();
  var tapped = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          "Create an\naccount",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Image.asset(
                  //   'assets/imgs/logo.webp',
                  //   height: 200,
                  // ),

                  // Text("Register"),
                  SizedBox(
                    height: 50,
                  ),

                  FormFields(
                      controller: registerController.firstName.value,
                      hintText: "First Name",
                      prefixIcon: Icon(Icons.person),
                      suffixIcon: null),
                  SizedBox(
                    height: 20,
                  ),
                  FormFields(
                      controller: registerController.lastName.value,
                      hintText: "Last Name",
                      prefixIcon: Icon(Icons.person),
                      suffixIcon: null),
                  SizedBox(
                    height: 20,
                  ),
                  FormFields(
                      controller: registerController.email.value,
                      hintText: "Email",
                      prefixIcon: Icon(Icons.email),
                      suffixIcon: null),
                  SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => FormFields(
                      controller: registerController.password.value,
                      hintText: "Password",
                      obscureText: tapped.value ? false : true,
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: Obx(
                        () => IconButton(
                          icon: Icon(tapped.value
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            tapped.value = !tapped.value;
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                        ),
                        child: Text(
                            "by clicking the Register button, you agree\nto the terms and conditions."),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(300, 60),
                      elevation: 0,
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () async {
                      //check if the email is good
                      if (!GetUtils.isEmail(
                          registerController.email.value.text)) {
                        Get.defaultDialog(
                            title: 'Invalid Email',
                            middleText: 'Please enter a valid email');
                        return;
                      }
                      //check if the password is good
                      if (registerController.password.value.text.length < 6) {
                        Get.defaultDialog(
                            title: 'Invalid Password',
                            middleText:
                                'Password must be at least 6 characters');
                        return;
                      }
                      User user = User(
                        email: registerController.email.value.text,
                        firstName: registerController.firstName.value.text,
                        lastName: registerController.lastName.value.text,
                        username: 'test',
                      );
                      await authController.registerUser(user);
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?"),
                      TextButton(
                        onPressed: () {
                          Get.to(LoginScreen());
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class FormFields extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;

  FormFields(
      {required this.controller,
      required this.hintText,
      required this.prefixIcon,
      this.suffixIcon,
      this.obscureText = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: TextFormField(
        controller: controller,
        validator: (v) {
          //Required Field
          if (v!.isEmpty) {
            return 'Field is required';
          }
        },
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
