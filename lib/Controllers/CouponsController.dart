import 'dart:convert';

import 'package:get/get.dart';
import 'package:woo_test/data/API.dart';
import 'package:woo_test/res/Endpoints.dart';

class CouponsController extends GetxController {
  Future getCoupons() async {
    var response = await ApiClient.get(EndPoints.COUPONS);
    var data = jsonDecode(response.body);
    print(data);
  }

  @override
  void onInit() {
    super.onInit();
    // getCoupons();
  }
}
