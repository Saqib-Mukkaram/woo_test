import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterViewModel extends GetxController {
  var _email = TextEditingController().obs;
  var _password = TextEditingController().obs;
  var _confirmPassword = TextEditingController().obs;
  var _firstName = TextEditingController().obs;
  var _lastName = TextEditingController().obs;
  var _phone = TextEditingController().obs;
  var _address = TextEditingController().obs;

  //Getters
  Rx<TextEditingController> get email => _email;

  Rx<TextEditingController> get password => _password;

  Rx<TextEditingController> get confirmPassword => _confirmPassword;

  Rx<TextEditingController> get firstName => _firstName;

  Rx<TextEditingController> get lastName => _lastName;

  Rx<TextEditingController> get phone => _phone;

  Rx<TextEditingController> get address => _address;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  // Future<void> registerUser() {
  //   // Register the User with the Woocommerce
  //   // await ApiClient.post("/wp-json/wc/v3/customers", user.toJson())
  //   //     .then((v) async {
  //   //   print(v);
  //   //   return true;
  //   // });
  //   return Future.value();
  // }
}
// }
// "email": "john.doe@example.com",
// "first_name": "John",
// "last_name": "Doe",
// "username": "john.doe",
// "billing": {
// "first_name": "John",
// "last_name": "Doe",
// "company": "",
// "address_1": "969 Market",
// "address_2": "",
// "city": "San Francisco",
// "state": "CA",
// "postcode": "94103",
// "country": "US",
// "email": "john.doe@example.com",
// "phone": "(555) 555-5555"
// },
// "shipping": {
// "first_name": "John",
// "last_name": "Doe",
// "company": "",
// "address_1": "969 Market",
// "address_2": "",
// "city": "San Francisco",
// "state": "CA",
// "postcode": "94103",
// "country": "US"
// }
