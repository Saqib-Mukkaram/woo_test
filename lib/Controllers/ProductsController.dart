import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:woo_test/Models/Categories.dart';
import 'package:woo_test/Models/Products.dart';
import 'package:woo_test/data/API.dart';
import 'package:woo_test/res/Endpoints.dart';

class ProductController extends GetxController {
  final _products = RxList<Products>();
  final _productsByCategory = RxList<Products>();
  final _categories = RxList<Categories>();
  var pageNum = 1;
  var isLoading = false.obs;
  var totalPages = 11;
  var url = '/wp-json/wc/v3/products?page=';
  var nextUrl = '';

  //get products
  RxList<Products> get products => _products;

  // Get categories
  RxList<Categories> get categories => _categories;

  // getProducts getter
  RxList<Products> get productsByCategory => _productsByCategory;

  @override
  void onInit() {
    getNextProducts();
    super.onInit();
  }

  Future getProductsByCategoryId(int id) async {
    _productsByCategory.clear();
    isLoading = true.obs;
    ApiClient.get('${EndPoints.PRODUCT_BY_CATEGORY}$id').then((value) {
      List<dynamic> encodedProducts = jsonDecode(value.body);
      for (var element in encodedProducts) {
        if (element['status'] == 'publish') {
          var x = Products.fromJson(element);
          kDebugMode ? print("product added without any errors") : null;
          _productsByCategory.add(x);
          _productsByCategory.refresh();
        } else {
          print("product not added ${element['name']}");
        }
      }
      isLoading = false.obs;
    });
  }

  Future getCategories() async {
    isLoading = true.obs;
    await ApiClient.get(EndPoints.CATEGORIES).then((value) {
      List<dynamic> encodedCategories = jsonDecode(value.body);
      for (var element in encodedCategories) {
        var x = Categories.fromJson(element);
        try {
          kDebugMode ? print("category added without any errors") : null;
          _categories.add(x);
          _categories.refresh();
        } catch (e) {
          print("category not added ${element['name']}");
        }
      }
      ;
      //print the length
      print("Length of the categories: ${_categories.length}");
      isLoading = false.obs;
    });
  }

  Future getProducts() async {
    isLoading = true.obs;
    await ApiClient.get('/wp-json/wc/v3/products').then((value) {
      // get the header
      // var header = jsonDecode(value.header);
      // //get the total pages
      // totalPages = header['x-wp-totalpages'];
      // List<dynamic> encodedProducts = jsonDecode(value.body);
      // // print(value.body);
      // for (var element in encodedProducts) {
      //   if (element['status'] == 'publish') {
      //     var x = Products.fromJson(element);
      //     kDebugMode ? print("product added without any errors") : null;
      //     // print(element);
      //     _products.add(x);
      //     _products.refresh();
      //   } else {
      //     print("product not added ${element['name']}");
      //   }
      // }
      print(value);
    });
    isLoading = false.obs;
    print("Length of the products: ${_products.length}");
  }

  // @override
  Future getNextProducts() async {
    isLoading = true.obs;
    if (pageNum <= totalPages) {
      kDebugMode ? print("pageNumber : $pageNum") : null;
      await ApiClient.get('${EndPoints.PRODUCTS_BY_PAGE}$pageNum')
          .then((value) {
        List<dynamic> encodedProducts = jsonDecode(value.body);
        encodedProducts.forEach((element) {
          // print(product.toString());
          if (element['status'] == 'publish') {
            try {
              var x = Products.fromJson(element);
              // kDebugMode ? print("product added without any errors") : null;
              _products.add(x);
              _products.refresh();
            } catch (e) {
              kDebugMode ? print("${element['name']} \n$e") : null;
            }
          } else {
            print("product not added ${element['name']}");
          }
        });
      });
      pageNum++;
    }
    isLoading = false.obs;
  }
}
