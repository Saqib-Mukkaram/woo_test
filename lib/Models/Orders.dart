import 'package:get/get.dart';
import 'package:woo_test/Models/Shipping.dart';
import 'package:woo_test/Models/User.dart';

import 'Products.dart';

class UserOrders {
  final int id;
  final String status;
  final String date;
  final String total;
  final User user;
  final Shipping shipping;
  final RxList<Products> products;

  //constructor with required
  UserOrders(
      {required this.id,
      required this.status,
      required this.date,
      required this.total,
      required this.user,
      required this.shipping,
      required this.products});

  //factory constructor to convert json to object
  factory UserOrders.fromJson(Map<String, dynamic> json) {
    return UserOrders(
      id: json['id'],
      status: json['status'],
      date: json['date'],
      total: json['total'],
      user: User.fromJson(json['user']),
      shipping: Shipping.fromJson(json['shipping']),
      products: RxList<Products>.from(
        json['products'].map(
          (x) => Products.fromJson(x),
        ),
      ),
    );
  }

  // to json
  Map<String, dynamic> toJson() => {
        'id': id,
        'status': status,
        'date': date,
        'total': total,
        'user': user.toJson(),
        'shipping': shipping.toJson(),
        'products': products.map((x) => x.toJson()).toList(),
      };
}
