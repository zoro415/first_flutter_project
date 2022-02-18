// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/widgets/custom_button.dart';
import 'package:lottie/lottie.dart';

class OrderSuccess extends StatelessWidget {
  const OrderSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/lottie/success.json',
                  repeat: false, width: 200),
              // Icon(
              //   Icons.check_circle,
              //   size: 100,
              //   color: greenColor,
              // ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Order Success',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Your Order has been placed successfully',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomButton('View Order Details', () {}),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'Back To Home',
                    style: TextStyle(color: greenColor),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
