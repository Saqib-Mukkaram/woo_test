import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo_test/Controllers/WpController.dart';
import 'package:woo_test/Views/Home.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 2), () async {
      // Get.find<WpController>().fetchData();
      Get.off(HomeScreen());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/imgs/logo.webp'),
      ),
    );
  }
}
