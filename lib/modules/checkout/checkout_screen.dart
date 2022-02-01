import 'package:flutter/material.dart';
import 'widgets/order_summary.dart';
import 'widgets/payment_method.dart';

import 'widgets/shipping_address.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OrderSummary(),
            ShippingAddress(),
            PaymentMethodContainer()
          ],
        ),
      ),
    );
  }
}
