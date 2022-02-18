// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/modules/checkout/checkout_controller.dart';

// enum PaymentMethod { cod, khalti }

class PaymentMethodContainer extends StatelessWidget {
  const PaymentMethodContainer({required this.isCod, Key? key})
      : super(key: key);
  final bool isCod;

  Widget getPaymentTile(
      {required String label,
      required bool isSelected,
      required VoidCallback onPressed}) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: greenColor.withOpacity(0.1),
                border:
                    Border.all(color: greenColor, width: isSelected ? 3 : 1),
                borderRadius: BorderRadius.circular(15)),
            height: 70,
            child: Image.asset(label)),
      ),
    );
  }

  // PaymentMethod paymentMethod = PaymentMethod.cod;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Payment Method",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                getPaymentTile(
                  label: 'assets/images/khalti.png',
                  isSelected: !isCod,
                  // paymentMethod == PaymentMethod.khalti,
                  onPressed: () {
                    Get.find<CheckoutController>().isCod(false);
                    // setState(() {
                    //   paymentMethod = PaymentMethod.khalti;
                    // });
                  },
                ),
                SizedBox(width: 30),
                getPaymentTile(
                  label: 'assets/images/cod.png',
                  isSelected: isCod,
                  // paymentMethod == PaymentMethod.cod,
                  onPressed: () {
                    Get.find<CheckoutController>().isCod(true);
                    // setState(() {
                    //   paymentMethod = PaymentMethod.cod;
                    // });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
