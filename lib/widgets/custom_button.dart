import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPress;

  CustomButton(this.label, this.onPress);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: MaterialButton(
        onPressed: onPress,
        color: greenColor,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
