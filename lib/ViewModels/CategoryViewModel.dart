import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:woo_test/Controllers/ProductsController.dart';
import 'package:woo_test/Models/Products.dart';

class CategoryViewModel extends GetxController {
  ProductController productController = Get.find();
  var scrollController = ScrollController().obs;
  var specificProducts = <Products>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  //get products
  RxList get products => productController.products;

  // Get categories
  RxList get categories => productController.categories;
}
