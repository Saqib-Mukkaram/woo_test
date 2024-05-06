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
          CircleAvatar()
          ,SizedBox(width: 10,)
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
                    BoxConstraints(maxHeight: 50, maxWidth: size.width),
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
                          itemCount:viewModel.categories.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 50,
                              width: 50,
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Image.network(
                                viewModel.categories[index].images![0].src,
                                fit: BoxFit.fitWidth,
                                width: 50,
                              ),
                            );
                          });
                    }
                  },
                )
              ),
              Text("Flash Sale"),
              SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: viewModel.productsController.getNextProducts(),
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
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, crossAxisSpacing: 8),
                            itemCount: viewModel.products.length,
                            itemBuilder: (context, index) {
                              return ProductCard(
                                  id: viewModel.products[index].id,
                                  name: viewModel.products[index].name,
                                  price: viewModel.products[index].price,
                                  image: viewModel.products[index].images);
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
