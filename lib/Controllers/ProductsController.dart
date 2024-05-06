import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:woo_test/Models/Categories.dart';
import 'package:woo_test/Models/Products.dart';
import 'package:woo_test/data/API.dart';

class ProductController extends GetxController {
  var _products = RxList<Products>();
  var _categories = RxList<Categories>();
  var pageNum = 1;
  var totalPages = 11;
  var url = '/wp-json/wc/v3/products?page=';
  var nextUrl = '';

  //get products
  RxList<Products> get products => _products;
  // Get categories
  RxList<Categories> get categories => _categories;

  // getProducts getter

  @override
  void onInit() {
    super.onInit();
  }

  Future getCategories() async {
    await ApiClient.get('/wp-json/wc/v3/products/categories').then((value) {
      List<dynamic> encodedCategories = jsonDecode(value.body);
      encodedCategories.forEach((element) {
        var x = Categories.fromJson(element);
        _categories.add(x);
        _categories.refresh();
      });
    });
    //print the length
    print("Length of the categories: ${_categories.length}");
  }

  Future getProducts() async {
    await ApiClient.get('/wp-json/wc/v3/products?page=$pageNum').then((value) {
      // get the header
      // var header = jsonDecode(value.header);
      // //get the total pages
      // totalPages = header['x-wp-totalpages'];
      List<dynamic> encodedProducts = jsonDecode(value.body);
      print(value.body);
      encodedProducts.forEach((element) {
        if (element['status'] == 'publish') {
          var x = Products.fromJson(element);
          kDebugMode ? print("product added without any errors") : null;
          print(element);
          _products.add(x);
          _products.refresh();
        } else {
          print("product not added ${element['name']}");
        }
      });
    });

    print("Length of the products: ${_products.length}");
  }

  // @override
  Future getNextProducts() async {
    if (pageNum <= totalPages) {
      await ApiClient.get('/wp-json/wc/v3/products?page=$pageNum')
          .then((value) {
        List<dynamic> encodedProducts = jsonDecode(value.body);
        encodedProducts.forEach((element) {
          // print(product.toString());
          if (element['status'] == 'publish') {
            var x = Products.fromJson(element);
            kDebugMode ? print("product added without any errors") : null;
            _products.add(x);
            _products.refresh();
          } else {
            print("product not added ${element['name']}");
          }
        });
      });
      pageNum++;
    }
  }
}
