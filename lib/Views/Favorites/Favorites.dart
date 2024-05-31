import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo_test/ViewModels/FavoritesViewModel.dart';

class Favorites extends StatelessWidget {
  Favorites({super.key});

  var FavoritesController = Get.find<FavoritesViewModel>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: FavoritesController.favoritesList.length,
        itemBuilder: (con, index) =>
            ListTile(
              title: Text("Item $index"),
              subtitle: Text("Price: \$${index * 10}"),
              leading: CachedNetworkImage(
                imageUrl: FavoritesController.favoritesList[index].images[0]
                    .src,
                width: 75,
              ),
              trailing: IconButton(
                onPressed: () {
                  FavoritesController.removeProductFromFavorites(
                      FavoritesController.favoritesList[index]);

                },
                icon: Icon(Icons.delete),
              ),
            ),
      ),
    );
  }
}
