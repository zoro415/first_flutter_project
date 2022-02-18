// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/modules/auth/change_password/change_password_controller.dart';
import 'package:grocery_nepal/widgets/custom_button.dart';
import 'package:grocery_nepal/widgets/loading.dart';
import 'package:grocery_nepal/widgets/password_field.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangePasswordController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          child: Column(
            children: [
              PasswordField(
                'Old Password',
                controller: controller.oldPasswordController,
              ),
              SizedBox(
                height: 30,
              ),
              PasswordField(
                'New Password',
                controller: controller.newPasswordController,
              ),
              SizedBox(
                height: 30,
              ),
              PasswordField(
                'Confirm Password',
                controller: controller.confirmPasswordController,
              ),
              SizedBox(
                height: 30,
              ),
              Obx(() => controller.isLoading.isTrue
                  ? Loading(
                      size: 100,
                    )
                  : CustomButton('Change Password', controller.changePassword)),
            ],
          ),
        ),
      ),
    );
  }
}
