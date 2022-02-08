// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/app_controller.dart';
import 'package:grocery_nepal/constants.dart';

class UserDetailBar extends StatelessWidget {
  const UserDetailBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appController = Get.find<AppController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            child: Icon(
              Icons.person,
              color: Colors.black,
            ),
            backgroundColor: greyColor,
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appController.userProfile!.name ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                appController.userProfile!.email ?? '',
                style: TextStyle(
                  color: greyColor,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
