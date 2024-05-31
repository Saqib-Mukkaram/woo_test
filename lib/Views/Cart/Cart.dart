import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo_test/ViewModels/CartViewModel.dart';

class Cart extends StatelessWidget {
  Cart({super.key});

  var _cartViewModel = Get.find<CartViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _cartViewModel.cartItems.length,
          itemBuilder: (con, index) => ListTile(
              title: Text("Item $index"),
              subtitle: Text("Price: \$${index * 10}"),
              leading: CachedNetworkImage(
                imageUrl:
                    _cartViewModel.cartItems[index].keys.first.images[0].src,
              ),
              trailing: Container(
                width: 200,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.remove),
                    ),
                    Text("Qty: $index"),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        _cartViewModel
                            .removeItem(_cartViewModel.cartItems[index]);
                            
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
