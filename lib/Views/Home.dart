import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo_test/Controllers/wooCommerceController.dart';
import 'package:woo_test/CustomWidgets/ProductCard.dart';
import 'package:woo_test/ViewModels/HomeViewModel.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // WooCommerceController controller = WooCommerceController();
  HomeViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          CircleAvatar(),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        controller: viewModel.scrollController.value,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                  constraints:
                      BoxConstraints(maxHeight: 150, maxWidth: size.width),
                  child: FutureBuilder(
                    future: viewModel.productsController.getCategories(),
                    builder: (con, snap) {
                      if (snap.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: viewModel.categories.length,
                            itemBuilder: (context, index) {
                              return Column(
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
                                            color: Colors.grey.withOpacity(0.2),
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
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.network(
                                        viewModel
                                            .categories[index].image[0].src,
                                        fit: BoxFit.fitWidth,
                                        width: 50,
                                      ),
                                    ),
                                  ),
                                  //Name of the Category
                                  Text(
                                    viewModel.categories[index].name,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
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
                  SizedBox(width: 20,),
                  Text("All Products"),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future: viewModel.productsController.getProducts(),
                builder: (con, snap) {
                  if (snap.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Container(
                        constraints: BoxConstraints(
                            maxHeight: size.height +
                                kToolbarHeight +
                                kBottomNavigationBarHeight,
                            maxWidth: size.width),
                        child: GridView.builder(
                            // physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 0.63),

                            itemCount: viewModel.products.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ProductCard(
                                    id: viewModel.products[index].id,
                                    name: viewModel.products[index].name,
                                    price: viewModel.products[index].price,
                                    image: viewModel.products[index].images),
                              );
                            }));
                  }
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
