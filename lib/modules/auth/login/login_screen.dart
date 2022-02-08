// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/modules/auth/login/login_controller.dart';
import 'package:grocery_nepal/modules/auth/register/register_screen.dart';
import 'package:grocery_nepal/widgets/custom_button.dart';
import 'package:grocery_nepal/widgets/input_field.dart';
import 'package:grocery_nepal/widgets/loading.dart';
import 'package:grocery_nepal/widgets/password_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginConrtoller());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Login',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              InputField('Email',
                  controller: controller.emailController,
                  inputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next),
              SizedBox(
                height: 20,
              ),
              PasswordField(
                'Password',
                controller: controller.passwordController,
              ),
              SizedBox(
                height: 30,
              ),
              Obx(
                () => controller.isLoading.isTrue
                    ? Loading(
                        size: 100,
                      )
                    : CustomButton('Login', () {
                        controller.login();
                      }),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text('New to Grocery Nepal?'),
                  TextButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, '/register');
                        Get.to(() => RegisterScreen());
                      },
                      child: Text('Register Now',
                          style: TextStyle(color: greenColor)))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
