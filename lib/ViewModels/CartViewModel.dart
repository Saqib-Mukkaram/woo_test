import 'package:get/get.dart';
import 'package:woo_test/Models/Products.dart';

class CartViewModel extends GetxController {
  var _cartItems = <Map<Products, int>>[].obs; // <Products,Quantity
  var _totalPrice = 0.0.obs;

  //Getter for _cartItems
  RxList<Map<Products, int>> get cartItems => _cartItems;

  Rx<double> get totalPrice => _totalPrice;

  //Calculate the Total Price
  void calculateTotalPrice() {
    double total = 0.0;
    for (var item in _cartItems) {
      item.forEach((key, value) {
        total += key.price * value;
      });
    }
    _totalPrice.value = total;
  }

  //remove the item from the cart
  void removeItem(Map<Products, int> item) {
    _cartItems.remove(item);
    calculateTotalPrice();
    refresh();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
