import 'dart:convert';

import 'package:get/get.dart';
import 'package:woo_test/Models/Orders.dart';
import 'package:woo_test/Models/User.dart';
import 'package:woo_test/data/API.dart';

class OrdersController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> createOrder(UserOrders order) async {
    // ApiClient.post("wp-json/wc/v3/orders", order).then((v) {
    //   var result = jsonDecode(v.body);
    //   print(result);
    //   Get.defaultDialog(
    //       title: 'Order Created', middleText: 'Order Created Successfully');
    // });
    Future.delayed(
      Duration(seconds: 2),
      () => Get.defaultDialog(
          title: 'Order Created', middleText: 'Order Created Successfully'),
    );
    return true;
  }
}
