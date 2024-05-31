import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo_test/CustomWidgets/InputField.dart';
import 'package:woo_test/ViewModels/RegisterViewModel.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  var registerController = Get.find<RegisterViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/imgs/logo.webp',
                height: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text("Register"),
              SizedBox(
                height: 10,
              ),
              InputField(
                placeholderText: 'First Name',
                fieldController: registerController.firstName.value,
                // isBorder: false,
              ),
              SizedBox(
                height: 10,
              ),
              InputField(
                placeholderText: 'Last Name',
                fieldController: registerController.lastName.value,
                // isBorder: false,
              ),
              SizedBox(
                height: 10,
              ),
              InputField(
                placeholderText: 'Email',
                fieldController: registerController.email.value,
              ),
              SizedBox(
                height: 10,
              ),
              InputField(
                placeholderText: 'Password',
                fieldController: registerController.password.value,
                obscureText: true,
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 50),
                  elevation: 8,
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)
                  )
                ),
                onPressed: () {},
                child: Text("Register"),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
