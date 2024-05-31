import 'package:get/get.dart';
import 'package:woo_test/Controllers/SharedPreferencesController.dart';
import 'package:woo_test/Controllers/WpController.dart';
import 'package:woo_test/ViewModels/CartViewModel.dart';
import 'package:woo_test/ViewModels/CategoryViewModel.dart';
import 'package:woo_test/ViewModels/FavoritesViewModel.dart';
import 'package:woo_test/ViewModels/HomeViewModel.dart';
import 'package:woo_test/ViewModels/RegisterViewModel.dart';
import 'package:woo_test/data/API.dart';

import 'Controllers/ProductsController.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiClient());
    Get.put(SharedPreferencesController());
    Get.put(ProductController());
    Get.put(WpController());

    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => RegisterViewModel());
    Get.lazyPut(() => CategoryViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => FavoritesViewModel());
  }
}
