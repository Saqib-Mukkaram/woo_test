import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:woo_test/Controllers/ProductsController.dart';
import 'package:woo_test/Models/Categories.dart';
import 'package:woo_test/Models/Products.dart';
import 'package:woocommerce_api/woocommerce_api.dart';

class HomeViewModel extends GetxController {
  ProductController productsController = Get.find();
  var scrollController = ScrollController().obs;
  var specificProducts = <Products>[].obs;
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    scrollController.value.addListener(() {
      if (scrollController.value.position.pixels ==
          scrollController.value.position.maxScrollExtent) {
        // At the bottom of the list, load more products

        print("At the Bottom of the List");
        productsController.getNextProducts();
      }
    });
    super.onInit();
  }

  Future<void> getSpecificProducts(int id) async {
    while (specificProducts.isEmpty) {
      await productsController.getNextProducts();
      specificProducts = productsController.products
          .where((element) {
            return element.category.id == id;
          })
          .toList()
          .obs;
      refresh();
    }
  }

  RxList<Products> get products => productsController.products;

  RxList<Categories> get categories => productsController.categories;
}
