import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:woo_test/Models/Images.dart';
import 'package:woo_test/Models/Products.dart';
import 'package:woo_test/Utils/Utils.dart';
import 'package:woo_test/ViewModels/CartViewModel.dart';
import 'package:woo_test/ViewModels/FavoritesViewModel.dart';

class ProductCard extends StatelessWidget {
  final int id;
  final String name;
  final double price;
  final List<Images> image;
  RxBool favoriteTapped;
  RxBool addedToCart;
  final Products product;

  ProductCard(
      {super.key,
      RxBool? addedToCart,
      RxBool? favoriteTapped,
      required this.product,
      required this.id,
      required this.name,
      required this.price,
      required this.image})
      : favoriteTapped = favoriteTapped ?? RxBool(false),
        addedToCart = addedToCart ?? RxBool(false);

  var _favoritesController = Get.find<FavoritesViewModel>();
  var _cartViewModel = Get.find<CartViewModel>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (con, sizeLimit) {
        return Stack(children: [
          Container(
            constraints: BoxConstraints(maxWidth: sizeLimit.maxHeight),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 1))
                ]),
            child: Column(
              children: [
                Hero(
                  tag: id,
                  child: CachedNetworkImage(
                    imageUrl: "${image[0].src}",
                    fit: BoxFit.contain,
                    width: sizeLimit.maxWidth,
                    height: 175,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("$name",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          // color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("\$$price",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: IconButton(
              onPressed: () {
                favoriteTapped.value = !favoriteTapped.value;
                if (favoriteTapped.value) {
                  _favoritesController.addProductToFavorites(product);
                  Utilities.showSnackbar("Added ${name} to favorites.");
                } else {
                  _favoritesController.removeProductFromFavorites(product);
                  Utilities.showSnackbar("Removed ${name} from favorites.");
                }
              },
              icon: Obx(() => favoriteTapped.value
                  ? Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : Icon(
                      Icons.favorite_border,
                    )),
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: IconButton(
                onPressed: () {
                  //Add to Cart
                  if (_cartViewModel.cartItems.containsKey(product)) {
                    _cartViewModel.cartItems[product] =
                        _cartViewModel.cartItems[product]! + 1;
                    addedToCart.value = true;
                  } else {
                    //remove from the cart
                    _cartViewModel.cartItems.remove(product);
                    addedToCart.value = false;
                  }
                },
                icon: Obx(() => addedToCart.value
                    ? Icon(
                        Icons.remove_shopping_cart,
                        color: Colors.blue,
                      )
                    : Icon(
                        Icons.add_shopping_cart,
                      )),
              ),
            ),
          ),
        ]);
      },
    );
  }
}

class ProductCategoryCard extends StatelessWidget {
  final int id;
  final String name;
  final double price;
  final List<Images> image;

  ProductCategoryCard(
      {super.key,
      required this.id,
      required this.name,
      required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (con, sizeLimit) {
        return Container(
          constraints: BoxConstraints(maxWidth: sizeLimit.maxHeight),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 1))
              ]),
          child: Column(
            children: [
              Hero(
                tag: id,
                child: Image.network(
                  "${image[0].src}",
                  fit: BoxFit.fitWidth,
                  width: sizeLimit.maxWidth,
                  height: 175,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("$name",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                        // color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w400)),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("\$$price",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

class ProductCategoryList extends StatelessWidget {
  final int id;
  final String name;
  final double price;
  final List<Images> image;

  ProductCategoryList(
      {super.key,
      required this.id,
      required this.name,
      required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (con, sizeLimit) {
        return Container(
            constraints: BoxConstraints(
                maxWidth: sizeLimit.maxHeight, maxHeight: sizeLimit.maxWidth),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 1))
                ]),
            child: ListTile(
              leading: Hero(
                tag: id,
                child: Image.network(
                  "${image[0].src}",
                  width: 75,
                  // height: 175,
                ),
              ),
              title: Text("$name",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
// color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
              subtitle: Text("\$$price",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
            ));
      },
    );
  }
}
