// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';

enum PaymentMethod { cod, khalti }

class PaymentMethodContainer extends StatefulWidget {
  const PaymentMethodContainer({Key? key}) : super(key: key);

  @override
  State<PaymentMethodContainer> createState() => _PaymentMethodContainerState();
}

class _PaymentMethodContainerState extends State<PaymentMethodContainer> {
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
              border: Border.all(color: greenColor, width: isSelected ? 3 : 1),
              borderRadius: BorderRadius.circular(15)),
          height: 70,
          child: Text(
            label,
          ),
        ),
      ),
    );
  }

  PaymentMethod paymentMethod = PaymentMethod.cod;

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
                  label: 'Khalti',
                  isSelected: paymentMethod == PaymentMethod.khalti,
                  onPressed: () {
                    setState(() {
                      paymentMethod = PaymentMethod.khalti;
                    });
                  },
                ),
                SizedBox(width: 30),
                getPaymentTile(
                  label: 'COD',
                  isSelected: paymentMethod == PaymentMethod.cod,
                  onPressed: () {
                    setState(() {
                      paymentMethod = PaymentMethod.cod;
                    });
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
