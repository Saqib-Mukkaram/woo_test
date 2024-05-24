import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo_test/CustomWidgets/ProductCardTypes.dart';
import 'package:woo_test/Models/Images.dart';
import 'package:woo_test/ViewModels/CategoryViewModel.dart';
import 'package:woo_test/ViewModels/CategoryViewModel.dart';
import 'package:woo_test/ViewModels/HomeViewModel.dart';
import 'package:woo_test/Views/Home.dart';
import 'package:woo_test/Views/Products/ProductPage.dart';

class CategoriesPage extends StatelessWidget {
  final String category;
  final int id;

  CategoriesPage({required this.id, required this.category, super.key});

  CategoryViewModel _viewModel = Get.find<CategoryViewModel>();

  var _switchViews = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(category),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Get.back();
              },
            ),
            actions: [
              IconButton(
                icon: Obx(() {
                  return _switchViews.value
                      ? Icon(Icons.grid_view)
                      : Icon(Icons.list);
                }),
                onPressed: () {
                  _switchViews.value = !_switchViews.value;
                },
              )
            ]),
        body: SafeArea(
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.sizeOf(context).height,
              maxWidth: MediaQuery.sizeOf(context).width,
            ),
            child: CustomScrollView(
              shrinkWrap: true,
              controller: _viewModel.scrollController.value,
              slivers: [
                FutureBuilder(
                  future: _viewModel.productController
                      .getProductsByCategoryId(id)
                      .then((value) {
                    _viewModel.specificProducts =
                        _viewModel.productController.productsByCategory;
                  }),
                  builder: (context, snap) {
                    if (snap.connectionState == ConnectionState.waiting) {
                      return SliverToBoxAdapter(
                        child: Center(
                          child: SizedBox(),
                        ),
                      );
                    } else {
                      return Obx(() => _switchViews.value
                          ? SliverGrid(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.63,
                              ),
                              delegate: SliverChildBuilderDelegate(
                                childCount: _viewModel.specificProducts.length,
                                (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.to(
                                            opaque: false,
                                            ProductPage(
                                              product: _viewModel
                                                  .specificProducts[index],
                                            ),
                                            transition:
                                                Transition.circularReveal,
                                            duration: Duration(seconds: 1));
                                      },
                                      child: ProductCategoryCard(
                                        id: _viewModel
                                            .specificProducts[index].id,
                                        name: _viewModel
                                            .specificProducts[index].name,
                                        price: _viewModel
                                            .specificProducts[index].price,
                                        image: _viewModel
                                            .specificProducts[index].images,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.to(
                                            opaque: false,
                                            ProductPage(
                                              product: _viewModel
                                                  .specificProducts[index],
                                            ),
                                            transition:
                                                Transition.circularReveal,
                                            duration: Duration(seconds: 1));
                                      },
                                      child: ProductCategoryList(
                                        id: _viewModel
                                            .specificProducts[index].id,
                                        name: _viewModel
                                            .specificProducts[index].name,
                                        price: _viewModel
                                            .specificProducts[index].price,
                                        image: _viewModel
                                            .specificProducts[index].images,
                                      ),
                                    ),
                                  );
                                },
                                childCount: _viewModel.specificProducts.length,
                              ),
                            ));
                    }
                  },
                ),
                Obx(() {
                  // Show loading indicator at the bottom
                  if (_viewModel.productController.isLoading.value) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    );
                  } else {
                    return SliverToBoxAdapter(child: SizedBox.shrink());
                  }
                }),
              ],
            ),
          ),
        ));
  }
}

/*
*
* */
