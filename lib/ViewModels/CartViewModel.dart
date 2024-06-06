import 'package:get/get.dart';
import 'package:woo_test/Models/Products.dart';

class CartViewModel extends GetxController {
  var _cartItems = <Products, int>{}.obs; // <Products,Quantity
  var _totalPrice = 0.0.obs;

  //Getter for the Cart Items
  RxMap<Products, int> get cartItems => _cartItems;

  Rx<double> get totalPrice => _totalPrice;

  //calculate Total Price
  void calculateTotalPrice() {
    _totalPrice.value = 0.0;
    _cartItems.forEach((key, value) {
      _totalPrice.value += key.price * value;
    });
  }

  //Add Item to Cart
  void addItem(Products product) {
    if (_cartItems.containsKey(product)) {
      _cartItems[product] = _cartItems[product]! + 1;
    } else {
      _cartItems[product] = 1;
    }
    calculateTotalPrice();
    refresh();
  }

  //Remove Item from Cart
  void removeItem(Products product) {
    if (_cartItems.containsKey(product)) {
      if (_cartItems[product] == 1) {
        _cartItems.remove(product);
      } else {
        _cartItems[product] = _cartItems[product]! - 1;
      }
    }
    calculateTotalPrice();
    refresh();
  }

  //Increase Quantity
  void increaseQuantity(Products product) {
    if (_cartItems.containsKey(product)) {
      _cartItems[product] = _cartItems[product]! + 1;
    }
    calculateTotalPrice();
    refresh();
  }

  //Decrease Quantity
  void decreaseQuantity(Products product) {
    if (_cartItems.containsKey(product)) {
      if (_cartItems[product] == 1) {
        _cartItems.remove(product);
      } else {
        _cartItems[product] = _cartItems[product]! - 1;
      }
    }
    calculateTotalPrice();
    refresh();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
