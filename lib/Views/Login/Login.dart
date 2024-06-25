import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo_test/CustomWidgets/InputField.dart';
import 'package:woo_test/ViewModels/LoginViewModel.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _viewModel = Get.find<LoginViewModel>();

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text("Welcome\nBack!",
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            SizedBox(
              height: 50,
            ),
            InputField(
                placeholderText: "Email ",
                fieldController: _viewModel.emailController.value),
            SizedBox(
              height: 20,
            ),
            InputField(
              placeholderText: "Password",
              fieldController: _viewModel.passwordController.value,
              obscureText: true,
              // suffixIcon: Icon(Icons.visibility),
            ),
          ],
        ));
  }
}
