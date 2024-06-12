import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:woo_test/CustomWidgets/CartCard.dart';
import 'package:woo_test/ViewModels/CartViewModel.dart';

class Cart extends StatelessWidget {
  Cart({super.key});

  var _cartViewModel = Get.find<CartViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      // resizeToAvoidBottomInset: true,
      appBar: AppBar(
          title: const Text("Cart",
              style: TextStyle(color: Colors.black, fontSize: 26)),
          centerTitle: true,
          elevation: 8,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back),
          )),
      body: SafeArea(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Obx(
            () => _cartViewModel.cartItems.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_cart_outlined,
                          size: 100,
                          color: Colors.blue,
                        ),
                        Text(
                          "Cart is Empty!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 32,
                              // wordSpacing: 10,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: _cartViewModel.cartItems.length + 1,
                    itemBuilder: (con, index) => _cartViewModel
                                .cartItems.length ==
                            index
                        ? SizedBox(
                            height: 120,
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              constraints: BoxConstraints(
                                minHeight: 200,
                                maxHeight: 200,
                                minWidth:
                                    MediaQuery.sizeOf(context).width * 0.95,
                                maxWidth:
                                    MediaQuery.sizeOf(context).width * 0.95,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        blurRadius: 4,
                                        spreadRadius: 2,
                                        offset: const Offset(0, 0))
                                  ]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    constraints: BoxConstraints(
                                        minWidth:
                                            (MediaQuery.sizeOf(context).width *
                                                    0.95) /
                                                2,
                                        maxWidth:
                                            (MediaQuery.sizeOf(context).width *
                                                    0.95) /
                                                2,
                                        minHeight: 200,
                                        maxHeight: 200),
                                    height: 200,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            "${_cartViewModel.cartItems.keys.elementAt(index).images[0].src}",
                                        fit: BoxFit.fill,
                                        width: 200,
                                        height: 200,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    constraints: BoxConstraints(
                                        minWidth:
                                            (MediaQuery.sizeOf(context).width *
                                                    0.95) /
                                                2,
                                        maxWidth:
                                            (MediaQuery.sizeOf(context).width *
                                                    0.95) /
                                                2),
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "${_cartViewModel.cartItems.keys.elementAt(index).name}",
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${_cartViewModel.cartItems.keys.elementAt(index).category.name}",
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: 'Price: ',
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:
                                                    '${_cartViewModel.cartItems.keys.elementAt(index).price}',
                                                style: const TextStyle(
                                                    color: Colors.blue),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                _cartViewModel.decreaseQuantity(
                                                    _cartViewModel
                                                        .cartItems.keys
                                                        .elementAt(index));
                                              },
                                              icon: const Icon(Icons.remove),
                                            ),
                                            Obx(
                                              () => Text(
                                                  "Qty: ${_cartViewModel.cartItems.values.elementAt(index)}"),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                _cartViewModel.increaseQuantity(
                                                    _cartViewModel
                                                        .cartItems.keys
                                                        .elementAt(index));
                                              },
                                              icon: const Icon(Icons.add),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                  ),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            // boxShadow: [
            //   BoxShadow(
            //       color: Colors.grey.withOpacity(0.5),
            //       blurRadius: 6,
            //       spreadRadius: 2,
            //       offset: const Offset(0, 0))
            // ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Obx(
                () => Text(
                  "Total Price: ${_cartViewModel.totalPrice}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Checkout",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
