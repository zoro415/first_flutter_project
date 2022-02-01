// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({Key? key}) : super(key: key);

  Widget getAddressRow({required String label, required String data}) {
    return Row(
      children: [
        Expanded(
            child: Text(
          label,
          style: TextStyle(color: Colors.grey.shade700),
        )),
        Expanded(
            child: Text(
          data,
          style: TextStyle(color: Colors.grey.shade700),
        )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Shipping Address",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Edit',
                  style: TextStyle(color: greenColor),
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: greenColor.withOpacity(0.1)),
            child: Column(
              children: [
                getAddressRow(label: "Phone Number : ", data: "9819138076"),
                getAddressRow(label: "Province : ", data: "Gandaki"),
                getAddressRow(label: "City : ", data: "Pokhara"),
                getAddressRow(label: "Address : ", data: "Majuwa - 32, Kaski"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
