import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Utilities {
  static double convertPrice(String json) {
    String priceString = json; // Assuming price comes as a string first
    double price;

    try {
      return price = double.parse(priceString);
    } catch (e) {
      try {
        // If parsing as double fails, try parsing as int
        return price = int.parse(priceString).toDouble();
      } catch (e) {
        // If parsing as int also fails, set a default value
        return price = 0.0;
      }
    }
  }

  static showSnackbar(String message) {
    Get.showSnackbar(GetSnackBar(
      borderRadius: 16,
      boxShadows: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 1))
      ],
      backgroundColor: Colors.white,
      padding: EdgeInsets.all(8),
      animationDuration: Duration(seconds: 1),
      forwardAnimationCurve: Curves.fastEaseInToSlowEaseOut,
      reverseAnimationCurve: Curves.easeOut,
      margin: EdgeInsets.only(bottom: 60, left: 20, right: 20),
      messageText: Text(
        message,
        textAlign: TextAlign.center,
      ),
      isDismissible: true,
      duration: Duration(milliseconds: 1500),
    ));
  }
}
