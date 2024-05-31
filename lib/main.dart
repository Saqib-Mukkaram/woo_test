import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo_test/Views/Register/Register.dart';
import 'package:woo_test/res/Theme.dart';
import 'AppBindings.dart';
import 'Views/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WooCommerce',
      theme: AppTheme.primaryTheme,
      initialBinding: AppBindings(),
      home: SplashScreen(),
    );
  }
}
