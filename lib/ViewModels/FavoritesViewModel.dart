import 'package:get/get.dart';
import 'package:woo_test/Controllers/SharedPreferencesController.dart';
import 'package:woo_test/Models/Products.dart';

import '../Controllers/ProductsController.dart';

class FavoritesViewModel extends GetxController {
  //list of the Favorites Products
  var _favorites = <Products>[].obs;

  // var _favoritesListPage = <Products>[].obs;
  var _sharedPrefsController = Get.find<SharedPreferencesController>();
  var _productsController = Get.find<ProductController>();

  //get the list of the Favorites Products
  RxList get favoritesList => _favorites;

  //get the list page
  // RxList get favoritesListPage => _favoritesListPage;

  @override
  void onInit() {
    // TODO: implement onInit
    //get the list of the Favorites Products from the shared preferences
    List<String>? favorites = _sharedPrefsController.getStringList("favorites");
    if (favorites != null) {
      _favorites.clear();
      if (_productsController.products.isNotEmpty) {
        _favorites.addAll(
          _productsController.products.where(
            (element) => favorites.contains(
              element.id.toString(),
            ),
          ),
        );
      }
    }
    super.onInit();
  }

  //set the list of the Favorites Products in the shared preferences
  void setFavoritesList() {
    _sharedPrefsController.setStringList(
        "favorites", _favorites.map((e) => e.id.toString()).toList());
  }

  //Add product to favorites
  void addProductToFavorites(product) {
    _favorites.add(product);
    refresh();
    //update shared prefs
    setFavoritesList();
  }

  //remove product from favorites
  void removeProductFromFavorites(product) {
    _favorites.remove(product);
  }

  //check if the product is in the favorites
  bool isProductInFavorites(product) {
    return _favorites.contains(product);
  }

  //clear all the favorites
  void clearFavorites() {
    _favorites.clear();
  }

//add product to favorites
}
