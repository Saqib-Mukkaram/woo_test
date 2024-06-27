// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:get/get.dart';
// import 'package:wordpress_client/wordpress_client.dart';
//
// class WpController extends GetxController {
//   final WordpressClient client =
//       WordpressClient(baseUrl: Uri.parse('https://myvape.ie/wp-json/wp/v2'));
//
//   void fetchData() async {
//     final String apiUrl = 'https://myvape.ie/wp-json';
//     final String applicationPassword = 'aCUh jBps zCkA D1Ex ow37 kjPS';
//     final String _tags = "/wp/v2/media";
//     try {
//       final request = ListPostRequest(
//         page: 1,
//         perPage: 20,
//         order: Order.asc,
//       );
//
//       final response = await client.posts.list(request);
//
// // Dart 3 style
//       switch (response) {
//         case WordpressSuccessResponse():
//           final data = response.data; // List<Post>
//
//           print(data);
//           break;
//         case WordpressFailureResponse():
//           final error = response.error; // WordpressError
//           print(error);
//           break;
//       }
//
//       // final response = await http.get(
//       //   Uri.parse(apiUrl + _tags),
//       //   headers: {
//       //     'Authorization': 'Bearer $applicationPassword',
//       //   },
//       // );
//       // print(response.headers);
//       // print("\n////////////////////\n");
//       // print(response.body);
//
//       // Handle response data...
//     } catch (e) {
//       // Handle error...
//     }
//   }
// }
