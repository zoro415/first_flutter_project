import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/data/models/order/cart_item.dart';
import 'package:grocery_nepal/modules/checkout/order_success.dart/order_success.dart';

class CheckoutController extends GetxController {
  final isLoading = false.obs;
  late final List<CartItem> cartItems;
  final isCod = true.obs;

  Map<String, String>? shippingAddress;
  // = {
  //   'phone': '',
  //   'province': '',
  //   'city': '',
  //   'address': '',
  // };

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    cartItems = Get.arguments;
  }

  void setShippingAddress(Map<String, String> address) {
    shippingAddress = address;
    update();
  }

  Future<void> checkout() async {
    if (shippingAddress == null) {
      Get.snackbar('Empty Shipping Address', 'Please Enter shipping address.',
          colorText: Colors.red, backgroundColor: Colors.red.withOpacity(0.2));
      return;
    }
    Get.off(() => OrderSuccess());
  }

  bool validateAddress() {
    if (shippingAddress!['phone']!.isEmpty) {
      Get.snackbar('Invalid Phone Number', 'Please Enter valid phone number');
      return false;
    }
    if (shippingAddress!['province']!.isEmpty) {
      Get.snackbar('Invalid Province Name', 'Please Enter valid Province Name');
      return false;
    }
    if (shippingAddress!['city']!.isEmpty) {
      Get.snackbar('Invalid City Name', 'Please Enter valid City Name');
      return false;
    }
    if (shippingAddress!['address']!.isEmpty) {
      Get.snackbar('Invalid Address', 'Please Enter valid Address');
      return false;
    }
    return true;
  }
}
