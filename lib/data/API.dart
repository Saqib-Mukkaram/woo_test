import 'dart:convert';

import 'package:get/get.dart' as getdart;

// import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

abstract class BaseNetworkAPI {
  static Future<dynamic> get(String url) {
    // TODO: implement get
    throw UnimplementedError();
  }

  static Future<dynamic> post(String url, dynamic data) {
    // TODO: implement post
    throw UnimplementedError();
  }

  static Future<dynamic> put(String url, dynamic data) {
    // TODO: implement put
    throw UnimplementedError();
  }

  static Future<dynamic> delete(String url) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}

class ApiClient extends getdart.GetxController {
  static final ApiClient _instance = ApiClient._internal();

  //factory constructor  for creating a singletons
  factory ApiClient() => _instance;

  //init the private constructor
  ApiClient._internal();

  static final baseUrl = 'https://myvape.ie';

  static final headers = {
    'Authorization': 'Basic ' +
        base64Encode(utf8.encode(
            'ck_beab4bda51e49ef9f2a0d41da524896a09987ca4:cs_ff07b32527d778423f870d192eb67ef509dbce2d')),
    'Content-Type': 'application/json',
  };

  @override
  void onInit() {
    super.onInit();
  }

  //constructor

  // @override
  static Future<dynamic> get(String url) async {
    try {
      var response = await http.get(Uri.parse(baseUrl + url), headers: headers);
      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
