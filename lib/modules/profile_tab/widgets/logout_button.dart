// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/modules/auth/login/login_screen.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.pushNamed(context, '/login');

        // Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (context) => LoginScreen()));
      },
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 100,
        child: Stack(
          children: [
            Center(
              child: Text(
                'Log Out',
                style: TextStyle(
                  color: greenColor,
                  fontSize: 17,
                ),
              ),
            ),
            Icon(
              Icons.logout,
              color: greenColor,
            )
          ],
        ),
      ),
      color: Colors.grey.shade300,
      elevation: 0,
    );
  }
}
