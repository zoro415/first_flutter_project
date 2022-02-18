import 'package:get/get.dart';
import 'package:grocery_nepal/data/api/local/cart_local.dart';
import 'package:grocery_nepal/data/models/order/cart_item.dart';
import 'package:grocery_nepal/data/models/product/product.dart';

class CartController extends GetxController {
  List<CartItem> cartItems = [];
  final total = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    getCart();
  }

  Future<void> getCart() async {
    cartItems = await CartLocal.get();
    calculateTotal();
    update();
  }

  void calculateTotal() {
    double newTotal = 0;
    cartItems.forEach((cartItem) {
      newTotal += (cartItem.quantity * cartItem.product.price);
    });
    total(newTotal);
  }

  Future<void> updateCart() async {
    CartLocal.set(cartItems);
    calculateTotal();
  }

  Future<void> addToCart(Product product, {int quantity = 1}) async {
    //add the desired product if there is none
    if (cartItems
            .firstWhereOrNull((element) => element.product.id == product.id) ==
        null) {
      cartItems.add(CartItem(product, quantity));
    } else {
      int index =
          cartItems.indexWhere((element) => element.product.id == product.id);
      cartItems[index].quantity += quantity;
    }

    //to update the cart items locally
    updateCart();
    update();
  }

  Future<void> removeFromCart(Product product) async {
    cartItems.removeWhere((element) => element.product.id == product.id);
    updateCart();
    update();
  }

  Future<void> changeQuantity(CartItem cartItem) async {
    int index = cartItems
        .indexWhere((element) => element.product.id == cartItem.product.id);
    cartItems[index].quantity = cartItem.quantity;
    updateCart();
    update();
  }
}
