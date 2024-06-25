import 'package:get/get.dart';

import 'package:woo_test/Controllers/ProductsController.dart';
import 'package:woo_test/Models/ProductVariations.dart';
import 'package:woo_test/Models/Products.dart';

class ProductsViewModel extends GetxController {
  var _productsController = Get.find<ProductController>();

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }

  Future<void> getVariationsById(int id) async {
    print("getVariationsById called");
    await _productsController.getProductsVariations(id);
  }

  // get products
  RxList<Products> get products => _productsController.products;

  //Getter Products Variations
  RxList<ProductVariations> get productsVariations =>
      _productsController.productsVariations;
}
