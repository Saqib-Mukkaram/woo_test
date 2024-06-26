import 'Billing.dart';
import 'Shipping.dart';

class User {

  final String email;
  final String firstName;
  final String lastName;
  final String username;

  // final String password;
  final Billing? billing;
  final Shipping? shipping;

  User({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.username,
    // this.password,
    this.billing,
    this.shipping,
  });

  //fromJson
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      username: json['username'],
      // password: json['password'],
      billing: Billing.fromJson(json['billing']) ?? null,
      shipping: Shipping.fromJson(json['shipping']) ?? null,
    );
  }

  //toJson
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'username': username,
      'billing': billing?.toJson(),
      'shipping': shipping?.toJson(),
    };
  }
}
