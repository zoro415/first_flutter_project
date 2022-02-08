// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/modules/auth/login/login_screen.dart';
import 'package:grocery_nepal/modules/auth/register/register_controller.dart';
import 'package:grocery_nepal/widgets/custom_button.dart';
import 'package:grocery_nepal/widgets/input_field.dart';
import 'package:grocery_nepal/widgets/loading.dart';
import 'package:grocery_nepal/widgets/password_field.dart';
import 'package:lottie/lottie.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterConrtoller());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Sign up',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              Text('Enter your credentails to continue'),
              SizedBox(
                height: 30,
              ),
              InputField(
                'FullName',
                inputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                controller: controller.nameController,
              ),
              SizedBox(
                height: 30,
              ),
              InputField(
                'Email',
                inputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                controller: controller.emailController,
              ),
              SizedBox(
                height: 30,
              ),
              PasswordField('Password',
                  controller: controller.passwordController),
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
                  : CustomButton('Register', controller.register)),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text('Already Registered?'),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Login', style: TextStyle(color: greenColor)))
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
