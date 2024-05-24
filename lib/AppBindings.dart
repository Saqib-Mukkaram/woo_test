import 'package:get/get.dart';
import 'package:woo_test/Controllers/SharedPreferencesController.dart';
import 'package:woo_test/ViewModels/CategoryViewModel.dart';
import 'package:woo_test/ViewModels/HomeViewModel.dart';
import 'package:woo_test/data/API.dart';

import 'Controllers/ProductsController.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiClient());
    Get.put(SharedPreferencesController());
    Get.put(ProductController());

    Get.lazyPut(() => CategoryViewModel());
    Get.lazyPut(() => HomeViewModel());
  }
}
