// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_nepal/constants.dart';

class InputField extends StatelessWidget {
  final String label;
  final TextInputType inputType;
  final TextInputAction textInputAction;
  final int maxLines;
  final TextEditingController? controller;

  InputField(this.label,
      {this.inputType = TextInputType.text,
      this.textInputAction = TextInputAction.done,
      this.maxLines = 1,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: inputType,
      maxLines: maxLines,
      style: TextStyle(fontWeight: FontWeight.bold),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: greenColor, width: 2)),
        labelText: label,
        labelStyle: TextStyle(
          color: greenColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
