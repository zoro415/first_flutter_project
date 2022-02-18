import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/modules/checkout/checkout_controller.dart';
import 'package:grocery_nepal/modules/checkout/order_success.dart/order_success.dart';
import 'package:grocery_nepal/widgets/custom_button.dart';
import 'widgets/order_summary.dart';
import 'widgets/payment_method.dart';

import 'widgets/shipping_address.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  OrderSummary(controller.cartItems),
                  ShippingAddress(),
                  Obx(
                    () => PaymentMethodContainer(
                      isCod: controller.isCod.value,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Obx(() => controller.isCod.isTrue
                ? CustomButton('Confirm Order', controller.checkout)
                : CustomButton('Pay Now', controller.checkout)),
          )
        ],
      ),
    );
  }
}
