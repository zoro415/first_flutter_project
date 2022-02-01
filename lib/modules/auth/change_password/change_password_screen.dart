import 'package:flutter/material.dart';
import 'package:grocery_nepal/widgets/custom_button.dart';
import 'package:grocery_nepal/widgets/password_field.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _oldPasswordController =
        TextEditingController();
    final TextEditingController _newPasswordController =
        TextEditingController();
    final TextEditingController _confirmPasswordController =
        TextEditingController();

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
                controller: _oldPasswordController,
              ),
              SizedBox(
                height: 30,
              ),
              PasswordField(
                'New Password',
                controller: _newPasswordController,
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
              CustomButton('Change Password', () {
                if (_newPasswordController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Empty Password')));
                } else if (_newPasswordController.text.trim() ==
                    _confirmPasswordController.text.trim()) {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Password Not Matched')));
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
