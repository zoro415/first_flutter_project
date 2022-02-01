import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';

class FormInputField extends StatelessWidget {
  final String hint;
  final int maxLines;

  FormInputField(this.hint, {this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontWeight: FontWeight.bold),
      cursorColor: Colors.black,
      maxLines: maxLines,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          hintText: hint,
          hintStyle: TextStyle(color: greenColor)),
    );
  }
}
