import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:woo_test/Controllers/wooCommerceController.dart';
import 'package:woo_test/CustomWidgets/CustomBottomNavigationBar.dart';
import 'package:woo_test/CustomWidgets/ProductCardTypes.dart';
import 'package:woo_test/CustomWidgets/Shimmers/CardListViewShimmer.dart';
import 'package:woo_test/CustomWidgets/Shimmers/CardShimmer.dart';
import 'package:woo_test/CustomWidgets/Shimmers/CategoryShimmer.dart';
import 'package:woo_test/ViewModels/HomeViewModel.dart';
import 'package:woo_test/Views/Account/Accounts.dart';
import 'package:woo_test/Views/Cart/Cart.dart';
import 'package:woo_test/Views/Categories/CategoriesPage.dart';
import 'package:woo_test/Views/Favorites/Favorites.dart';

import 'Products/ProductPage.dart';
import 'Settings/Settings.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // WooCommerceController controller = WooCommerceController();
  HomeViewModel viewModel = Get.find();
  List<Widget> pages = [
    Home(),
    Favorites(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,

        // backgroundColor: Colors.transparent,
        extendBody: true,
        bottomNavigationBar: CustomBottomNavigationBarWidget(
          selectedIndex: viewModel.selectedIndex,
        ),
        appBar: AppBar(
          title: Obx(() => viewModel.selectedIndex.value == 0
              ? Text(
                  "My Vape Shop",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                )
              : viewModel.selectedIndex.value == 1
                  ? Text(
                      " Favorites",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    )
                  : Text(
                      "Accounts",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    )),
          centerTitle: true,
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   onPressed: () {},
          // ),
          // actions: [
          //   CircleAvatar(),
          //   SizedBox(
          //     width: 10,
          //   )
          // ],
        ),
        body: Obx(
          () => pages[viewModel.selectedIndex.value],
        ),
        floatingActionButton: Obx(
          () => viewModel.selectedIndex.value == 0
              ? FloatingActionButton(
                  onPressed: () {
                    Get.to(
                      Cart(),

                      // transition: Transition.topLevel,
                    );
                  },
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.blue,
                  ))
              : SizedBox.shrink(),
        ));
  }
}

class Home extends StatelessWidget {
  Home({super.key});

  HomeViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1));
          // setState(() {});
        },
        child: Center(
          child: Container(
              constraints:
                  BoxConstraints(maxHeight: size.height, maxWidth: size.width),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    FutureBuilder(
                      future: Future.delayed(
                        Duration(seconds: 10),
                      ),
                      builder: (con, snap) {
                        if (snap.connectionState == ConnectionState.waiting) {
                          return Center(
                            child: Container(
                                width: double.infinity,
                                height: 300,
                                child: CardShimmer()),
                          );
                        } else {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ImageSlideshow(
                                width: double.infinity,
                                height: 300,
                                isLoop: true,
                                // initialPage: 0
                                autoPlayInterval: 2000,
                                indicatorColor: Colors.blue,
                                indicatorBackgroundColor: Colors.grey,
                                children: [
                                  CachedNetworkImage(
                                      imageUrl:
                                          viewModel.featuredProductsWidgets[0]),
                                  CachedNetworkImage(
                                      imageUrl:
                                          viewModel.featuredProductsWidgets[1]),

                                ],
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Seach By Category",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),),
                        ),
                      ],
                    ),
                    //Categoiries
                    Container(
                        constraints: BoxConstraints(
                            maxHeight: 165, maxWidth: size.width),
                        child: FutureBuilder(
                          future: viewModel.productsController.getCategories(),
                          builder: (con, snap) {
                            // print('Product category ids: ${viewModel.categories.map((e) => e.id).toList()}');
                            if (snap.connectionState ==
                                ConnectionState.waiting) {
                              return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 4,
                                  itemBuilder: (con, index) => Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          CategoryShimmer(),
                                        ],
                                      ));
                            } else {
                              return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: viewModel.categories.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        // print("Category ID: ${viewModel.categories}")
                                        Get.to(CategoriesPage(
                                          category:
                                              viewModel.categories[index].name,
                                          id: viewModel.categories[index].id,
                                        ));
                                      },
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            height: 100,
                                            width: 100,
                                            margin: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    spreadRadius: 3,
                                                    blurRadius: 5,
                                                    offset: const Offset(0,
                                                        -1), // changes position of shadow
                                                  ),
                                                ],
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: CachedNetworkImage(
                                                imageUrl: viewModel
                                                    .categories[index]
                                                    .image[0]
                                                    .src,
                                                fit: BoxFit.fitWidth,
                                                width: 50,
                                              ),
                                            ),
                                          ),
                                          //Name of the Category
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              maxLines: 1,
                                              viewModel.categories[index].name,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            }
                          },
                        )),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Products",style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                      ],
                    ),
                    FutureBuilder(
                      future: viewModel.productsController.getNextProducts(),
                      builder: (con, snap) {
                        if (snap.connectionState == ConnectionState.waiting) {
                          return Center(child: CardListViewShimmer());
                        } else {
                          if (viewModel.products.isEmpty) {
                            return Center(
                              child: Text("No Products Found"),
                            );
                          }
                          return Container(
                            height: 300,
                            child: Obx(
                              () => ListView.builder(
                                  controller: viewModel.scrollController.value,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: viewModel.products.length,
                                  itemBuilder: (con, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(
                                            opaque: false,
                                            ProductPage(
                                              product:
                                                  viewModel.products[index],
                                            ),
                                            transition:
                                                Transition.circularReveal,
                                            duration:
                                                Duration(milliseconds: 1000),
                                          );
                                        },
                                        child: ProductCard(
                                          id: viewModel.products[index].id,
                                          name: viewModel.products[index].name,
                                          price:
                                              viewModel.products[index].price,
                                          image:
                                              viewModel.products[index].images,
                                          product: viewModel.products[index],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          );
                        }
                      },
                    ),
                    //Second Products
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Products",style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                      ],
                    ),

                    FutureBuilder(
                      future: viewModel.productsController.getNextProducts(),
                      builder: (con, snap) {
                        if (snap.connectionState == ConnectionState.waiting) {
                          // return SliverToBoxAdapter(
                          //   child: Center(
                          //     child: CircularProgressIndicator(),
                          //   ),
                          // );
                          return Center(
                            child: CardListViewShimmer(),
                          );
                        } else {
                          if (viewModel.products.isEmpty) {
                            return Center(
                              child: Text("No Products Found"),
                            );
                          }
                          return Container(
                            height: 300,
                            child: ListView.builder(
                                // controller: viewModel.scrollController.value,
                                scrollDirection: Axis.horizontal,
                                itemCount: viewModel.products.length,
                                itemBuilder: (con, index) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(
                                              opaque: false,
                                              ProductPage(
                                                product:
                                                    viewModel.products[index],
                                              ),
                                              transition:
                                                  Transition.circularReveal,
                                              duration:
                                                  Duration(milliseconds: 1000));
                                        },
                                        child: ProductCard(
                                          id: viewModel.products[index].id,
                                          name: viewModel.products[index].name,
                                          price:
                                              viewModel.products[index].price,
                                          image:
                                              viewModel.products[index].images,
                                          product: viewModel.products[index],
                                        ),
                                      ),
                                    )),
                          );
                        }
                      },
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
/*
CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FutureBuilder(
                        future:viewModel.products.isEmpty ? Future.delayed(Duration(seconds: 6)) : null,
                        builder: (con, snap) {

                          if (snap.connectionState == ConnectionState.waiting) {
                            return Center(
                              child: Container(
                                  width: double.infinity,
                                  height: 300,
                                  child: CardShimmer()),
                            );
                          } else {

                            return ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: ImageSlideshow(
                                width: double.infinity,
                                height: 300,
                                isLoop: true,
                                // initialPage: 0
                                autoPlayInterval: 2000,
                                indicatorColor: Colors.blue,
                                indicatorBackgroundColor: Colors.grey,
                                children: [
                                  CachedNetworkImage(imageUrl: viewModel.featuredProductsWidgets[0]),
                                  CachedNetworkImage(imageUrl: viewModel.featuredProductsWidgets[1]),
                                  CachedNetworkImage(imageUrl: viewModel.featuredProductsWidgets[2]),
                                  CachedNetworkImage(imageUrl: viewModel.featuredProductsWidgets[3]),
                                ],

                              ),
                            );
                          }
                        },
                      )),
                ),
                //Categories
                SliverList(
                    delegate: SliverChildListDelegate([
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      constraints:
                          BoxConstraints(maxHeight: 165, maxWidth: size.width),
                      child: FutureBuilder(
                        future: viewModel.productsController.getCategories(),
                        builder: (con, snap) {
                          // print('Product category ids: ${viewModel.categories.map((e) => e.id).toList()}');
                          if (snap.connectionState == ConnectionState.waiting) {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                itemBuilder: (con, index) => Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        CategoryShimmer(),
                                      ],
                                    ));
                          } else {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: viewModel.categories.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      // print("Category ID: ${viewModel.categories}")
                                      Get.to(CategoriesPage(
                                        category:
                                            viewModel.categories[index].name,
                                        id: viewModel.categories[index].id,
                                      ));
                                    },
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: 100,
                                          width: 100,
                                          margin: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.2),
                                                  spreadRadius: 3,
                                                  blurRadius: 5,
                                                  offset: const Offset(0,
                                                      -1), // changes position of shadow
                                                ),
                                              ],
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: Image.network(
                                              viewModel.categories[index]
                                                  .image[0].src,
                                              fit: BoxFit.fitWidth,
                                              width: 50,
                                            ),
                                          ),
                                        ),
                                        //Name of the Category
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            maxLines: 1,
                                            viewModel.categories[index].name,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          }
                        },
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Products",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )
                ])),
                //Products
                FutureBuilder(
                  future: viewModel.productsController.getNextProducts(),
                  builder: (con, snap) {
                    if (snap.connectionState == ConnectionState.waiting) {
                      return SliverToBoxAdapter(
                        child: Center(child: CardListViewShimmer()),
                      );
                    } else {
                      if (viewModel.products.isEmpty) {
                        return SliverToBoxAdapter(
                          child: Center(
                            child: Text("No Products Found"),
                          ),
                        );
                      }
                      return SliverToBoxAdapter(
                        child: Container(
                          height: 300,
                          child: Obx(
                            () => ListView.builder(
                                controller: viewModel.scrollController.value,
                                scrollDirection: Axis.horizontal,
                                itemCount: viewModel.products.length,
                                itemBuilder: (con, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.to(
                                          opaque: false,
                                          ProductPage(
                                            product: viewModel.products[index],
                                          ),
                                          transition: Transition.circularReveal,
                                          duration:
                                              Duration(milliseconds: 1000),
                                        );
                                      },
                                      child: ProductCard(
                                        id: viewModel.products[index].id,
                                        name: viewModel.products[index].name,
                                        price: viewModel.products[index].price,
                                        image: viewModel.products[index].images,
                                        product: viewModel.products[index],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      );
                    }
                  },
                ),
                //Second Products
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Products"),
                  ),
                ),

                FutureBuilder(
                  future: viewModel.productsController.getNextProducts(),
                  builder: (con, snap) {
                    if (snap.connectionState == ConnectionState.waiting) {
                      // return SliverToBoxAdapter(
                      //   child: Center(
                      //     child: CircularProgressIndicator(),
                      //   ),
                      // );
                      return SliverToBoxAdapter(
                        child: Center(
                          child: CardListViewShimmer(),
                        ),
                      );
                    } else {
                      if (viewModel.products.isEmpty) {
                        return SliverToBoxAdapter(
                          child: Center(
                            child: Text("No Products Found"),
                          ),
                        );
                      }
                      return SliverToBoxAdapter(
                        child: Container(
                          height: 300,
                          child: ListView.builder(
                              // controller: viewModel.scrollController.value,
                              scrollDirection: Axis.horizontal,
                              itemCount: viewModel.products.length,
                              itemBuilder: (con, index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.to(
                                            opaque: false,
                                            ProductPage(
                                              product:
                                                  viewModel.products[index],
                                            ),
                                            transition:
                                                Transition.circularReveal,
                                            duration:
                                                Duration(milliseconds: 1000));
                                      },
                                      child: ProductCard(
                                        id: viewModel.products[index].id,
                                        name: viewModel.products[index].name,
                                        price: viewModel.products[index].price,
                                        image: viewModel.products[index].images,
                                        product: viewModel.products[index],
                                      ),
                                    ),
                                  )),
                        ),
                      );
                    }
                  },
                ),
                // Obx(() {
                //   // Show loading indicator at the bottom
                //   if (viewModel.productsController.isLoading.value) {
                //     return SliverToBoxAdapter(
                //       child: Center(
                //         child: Padding(
                //             padding: EdgeInsets.all(16.0),
                //             child: GridView.builder(
                //                 shrinkWrap: true,
                //                 gridDelegate:
                //                     SliverGridDelegateWithFixedCrossAxisCount(
                //                         crossAxisCount: 2),
                //                 itemCount: 2,
                //                 itemBuilder: (con, index) => Padding(
                //                       padding: const EdgeInsets.all(8.0),
                //                       child: CardShimmer(),
                //                     ))),
                //       ),
                //     );
                //   } else {
                //     return SliverToBoxAdapter(child: SizedBox.shrink());
                //   }
                // }),
              ],
            ),


* */
