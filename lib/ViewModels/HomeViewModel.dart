import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:woo_test/Controllers/ProductsController.dart';
import 'package:woo_test/Models/Categories.dart';
import 'package:woo_test/Models/Products.dart';
// import 'package:woocommerce_api/woocommerce_api.dart';

class HomeViewModel extends GetxController {
  ProductController productsController = Get.find();
  var scrollController = ScrollController().obs;
  var specificProducts = <Products>[].obs;
  var featuredList = <String>[].obs;
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

  Future<List<String>> getFeaturedProducts() async {
    // check if the Products are fetched

    Future.delayed(Duration(seconds: 5)).then((v) {
      var list = productsController.products
          .where((element) => element.featured == true)
          .map((e) => e.images[0].src)
          .toList()
          .obs;
      return featuredList = list;
    });
    return featuredList;

    // fetch the products
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

  RxList<Products> get products {
    refresh();
    return productsController.products;
  }

  RxList<String> get featuredProductsWidgets {
    refresh();

    var list = productsController.products
        .where((element) => element.featured == true)
        .expand((product) => product.images
            .map((image) => image.src)) // Get all images of each product
        .toList()
        .obs;
    return list;
  }

  RxList<Categories> get categories {
    refresh();
    return productsController.categories;
  }
}
