// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:woo_test/Models/Products.dart';
// import 'package:woocommerce_api/woocommerce_api.dart';
// import 'package:http/http.dart' as http;

// class WooCommerceController extends GetxController {
//   List<Products> productsList = [];
//   // WooCommerceAPI wooCommerceAPI = WooCommerceAPI(
//   //     url: 'https://myvape.ie',
//   //     consumerKey: 'ck_beab4bda51e49ef9f2a0d41da524896a09987ca4',
//   //     consumerSecret: 'cs_ff07b32527d778423f870d192eb67ef509dbce2d');

//   Future testApiRequest() async {
//     String basicAuth = 'Basic ' +
//         base64Encode(utf8.encode(
//             'ck_beab4bda51e49ef9f2a0d41da524896a09987ca4:cs_ff07b32527d778423f870d192eb67ef509dbce2d'));
//     Map<String, String> headers = {
//       'Authorization': basicAuth,
//       'Content-Type': 'application/json',
//     };
//     var response = await http.get(
//         Uri.parse('https://myvape.ie/wp-json/wc/v3/products?page=1'),
//         headers: headers);

//     print(response.headers);
//     // print(response.body);
//     int index = 0;
//     List<dynamic> products = jsonDecode(response.body);
//     print("Mapping");
//     products.forEach((product) {
//       // print(product.toString());
//       if (product['status'] == 'publish') {
//         var x = Products.fromJson(product);
//         print("product added without any errors");
//         productsList.add(x);
//       } else {
//         print("product not added ${product['name']}");
//       }
//     });

//     print(productsList.length);
//   }

//   Future getAllProducts() async {
//     var products = await wooCommerceAPI.getAsync('/wp-json/wc/v3/products');
//     print(products);
//   }
// }
