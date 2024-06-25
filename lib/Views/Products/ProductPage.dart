import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo_test/Models/Products.dart';

// import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:woo_test/ViewModels/CartViewModel.dart';
import 'package:woo_test/ViewModels/ProductViewModel.dart';

class ProductPage extends StatelessWidget {
  final Products product;

  ProductPage({super.key, required this.product});

  final _cartViewModel = Get.find<CartViewModel>();
  final _viewModel = Get.find<ProductsViewModel>();

  var addedToCart = false.obs;
  var favoriteTapped = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // backgroundColor: Colors.white.withOpacity(0.1),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          title: Text("${product.name}"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Hero(
                    tag: product.id,
                    child: Image.network(
                      "${product.images[0].src}",
                      fit: BoxFit.fitWidth,
                      width: MediaQuery.sizeOf(context).width * .9,
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 10, bottom: 5, left: 12, right: 12),
                  padding: EdgeInsets.all(8),
                  constraints: BoxConstraints(
                      minWidth: MediaQuery.sizeOf(context).width * 0.95),
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
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${product.name}",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "€${product.price}",
                            style: TextStyle(
                                fontSize: 18, color: Colors.blueAccent),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: IconButton(
                              onPressed: () {
                                favoriteTapped.value = !favoriteTapped.value;
                              },
                              icon: Obx(
                                () => favoriteTapped.value
                                    ? Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                    : Icon(
                                        Icons.favorite_border,
                                      ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                    width: Get.width,
                    height: 190,
                    margin: EdgeInsets.only(
                        top: 5, bottom: 10, left: 12, right: 12),
                    padding: EdgeInsets.all(8),
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
                        Row(
                          children: [
                            Text(
                              "More related to this product",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        FutureBuilder(
                          future: _viewModel.getVariationsById(product.id),
                          builder: (c, snap) {
                            if (snap.connectionState ==
                                ConnectionState.waiting) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [CircularProgressIndicator()],
                              );
                            }
                            if (_viewModel.productsVariations.isNotEmpty) {
                              return Obx(() => Container(


                                    constraints: BoxConstraints(
                                      minWidth:
                                          MediaQuery.sizeOf(context).width * .9,
                                      maxHeight: 150,
                                    ),
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          _viewModel.productsVariations.length,
                                      itemBuilder: (con, item) {
                                        return Obx(
                                          () => Container(
                                            width: 150,
                                            height: 125,
                                            margin: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.withOpacity(0.2),
                                                    spreadRadius: 5,
                                                    blurRadius: 7,
                                                    offset: Offset(0, 1),
                                                  )
                                                ]),
                                            // color: Colors.red,

                                            child: Column(
                                              children: [
                                                ClipRRect(
                                                  child: CachedNetworkImage(
                                                    imageUrl: _viewModel
                                                        .productsVariations[
                                                            item]
                                                        .image
                                                        .src,
                                                    fit: BoxFit.cover,
                                                    width: 100,
                                                    height: 100,
                                                  ),
                                                ),
                                                Text(
                                                  "€${_viewModel.productsVariations[item].price}",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.blueAccent),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ));
                            } else {
                              return Center(
                                child: Text("No Variations For this Product."),
                              );
                            }
                          },
                        ),
                      ],
                    )),
                Container(
                  margin:
                      EdgeInsets.only(top: 5, bottom: 10, left: 12, right: 12),
                  padding: EdgeInsets.all(8),
                  // constraints: BoxConstraints(
                  //     minWidth: MediaQuery.sizeOf(context).width * 0.95),
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
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HtmlWidget(
                        product.description,
                      ),
                    ],
                  ),
                ),

                // Html(data: product.shortDescription),
                // Text("${product.description}"),
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _cartViewModel.cartItems.containsKey(product)
              ? _cartViewModel.removeItem(product)
              : _cartViewModel.addItem(product);
          Get.showSnackbar(GetSnackBar(
            borderRadius: 16,
            boxShadows: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 1))
            ],
            backgroundColor: Colors.white,
            padding: EdgeInsets.all(8),
            animationDuration: Duration(seconds: 1),
            forwardAnimationCurve: Curves.fastEaseInToSlowEaseOut,
            reverseAnimationCurve: Curves.easeOut,
            margin: EdgeInsets.only(bottom: 60, left: 20, right: 20),
            messageText: Obx(
              () => Text(
                addedToCart.value
                    ? "Added ${product.name} to cart."
                    : "Removed ${product.name}from cart.",
                textAlign: TextAlign.center,
              ),
            ),
            isDismissible: true,
            duration: Duration(seconds: 3),
          ));
          addedToCart.value = !addedToCart.value;
        },
        backgroundColor: Colors.white,
        child: Obx(
          () => addedToCart.value
              ? Icon(
                  Icons.remove_shopping_cart_outlined,
                  color: Colors.red,
                )
              : Icon(
                  Icons.add_shopping_cart_outlined,
                  color: Colors.lightGreen,
                ),
        ),
      ),
    );
  }
}
