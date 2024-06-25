import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:woo_test/ViewModels/CartViewModel.dart';

class CartCard extends StatelessWidget {
  final String productName;
  final String category;
  final double price;
  final double quantity;

  final _cartViewModel = Get.find<CartViewModel>();

  CartCard(
      {required this.productName,
      required this.category,
      required this.price,
      required this.quantity,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        constraints: BoxConstraints(
          minHeight: 200,
          maxHeight: 200,
          minWidth: MediaQuery.sizeOf(context).width * 0.95,
          maxWidth: MediaQuery.sizeOf(context).width * 0.95,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(
                  minWidth: (MediaQuery.sizeOf(context).width * 0.95) / 2,
                  maxWidth: (MediaQuery.sizeOf(context).width * 0.95) / 2,
                  minHeight: 200,
                  maxHeight: 200),
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl:
                      "https://quotefancy.com/media/wallpaper/3840x2160/2050620-William-S-Burroughs-Quote-Nothing-is-true-everything-is-permitted.jpg",
                  fit: BoxFit.fill,
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            Container(
              constraints: BoxConstraints(
                  minWidth: (MediaQuery.sizeOf(context).width * 0.95) / 2,
                  maxWidth: (MediaQuery.sizeOf(context).width * 0.95) / 2),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text("Category:"),
                  Text("Price:"),
                  // Spacer(),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.remove),
                      ),
                      Text("Qty: "),
                      IconButton(
                        onPressed: () {
                          // _cartViewModel.increaseQuantity();
                        },
                        icon: Icon(Icons.add),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
