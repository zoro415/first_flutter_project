// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_nepal/constants.dart';

class PasswordField extends StatefulWidget {
  final String label;
  final TextEditingController controller;

  PasswordField(this.label, {required this.controller});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:
          widget.controller, //to access the value from above stateful widget
      obscureText: isPassword,
      style: TextStyle(fontWeight: FontWeight.bold),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              isPassword = !isPassword;
            });
          },
          child: isPassword
              ? Icon(Icons.visibility_off, color: Colors.grey)
              : Icon(Icons.visibility, color: Colors.black),
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: greenColor, width: 2)),
        labelText: widget.label,
        labelStyle: TextStyle(
          color: greenColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
