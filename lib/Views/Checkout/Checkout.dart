import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo_test/Models/Orders.dart';
import 'package:woo_test/Models/User.dart';
import 'package:woo_test/ViewModels/CartViewModel.dart';
import 'package:woo_test/Views/Orders/Orders.dart';


import '../../Controllers/OrderController.dart';
import '../../Models/Shipping.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});

  var _cartViewModel = Get.find<CartViewModel>();
  var _orderController = Get.find<OrdersController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Checkout"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          )),
      body: Column(
        children: [
          // Text for Deliver Address
          Text("Delivery Address"),

          //Add Container for Shipping
          // Container(
          //     child: Column(children: [
          //   Text("Shipping Address"),
          //       TextField(
          //     decoration: InputDecoration(hintText: "Enter Address"),
          //   ),
          //   TextField(
          //     decoration: InputDecoration(hintText: "Enter City"),
          //   ),
          //   TextField(
          //     decoration: InputDecoration(hintText: "Enter State"),
          //   ),
          //   TextField(
          //     decoration: InputDecoration(hintText: "Enter Zip Code"),
          //   ),
          // ])),
          //Add Card for Payment

          Expanded(
            child: ListView.builder(
              itemCount: _cartViewModel.cartItems.length,
              itemBuilder: (con, index) {
                var product = _cartViewModel.cartItems.keys.elementAt(index);
                var quantity = _cartViewModel.cartItems.values.elementAt(index);
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text("Price: ${product.price}"),
                  trailing: Text("Quantity: $quantity"),
                );
              },
            ),
          ),
          Text("Total Price: ${_cartViewModel.totalPrice}"),
          ElevatedButton(
            onPressed: () {
              UserOrders _order = UserOrders(
                  id: DateTime.now().millisecondsSinceEpoch,
                  status: "pending",
                  date: DateTime.now().toString(),
                  total: _cartViewModel.totalPrice.value.toString(),
                  user: User(
                      email: '', firstName: '', lastName: '', username: ''),
                  shipping: Shipping(
                      firstName: '',
                      lastName: '',
                      address: '',
                      city: '',
                      postcode: '',
                      country: ''),
                  products: RxList(_cartViewModel.cartItems.keys.toList()));
              _orderController.createOrder(_order);
            },
            child: Text("Place Order"),
          )
        ],
      ),
    );
  }
}
