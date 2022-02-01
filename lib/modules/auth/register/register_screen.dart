// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/modules/auth/login/login_screen.dart';
import 'package:grocery_nepal/widgets/custom_button.dart';
import 'package:grocery_nepal/widgets/input_field.dart';
import 'package:grocery_nepal/widgets/password_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
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
              ),
              SizedBox(
                height: 30,
              ),
              InputField(
                'Email',
                inputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(
                height: 30,
              ),
              PasswordField(
                'Password',
                controller: _passwordController,
              ),
              SizedBox(
                height: 30,
              ),
              PasswordField(
                'Confirm Password',
                controller: _confirmPasswordController,
              ),
              SizedBox(
                height: 30,
              ),
              CustomButton('Register', () {
                if (_passwordController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Empty Password')));
                } else if (_passwordController.text.trim() ==
                    _confirmPasswordController.text.trim()) {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Password Not Matched')));
                }
              }),
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

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
