// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:grocery_nepal/widgets/custom_button.dart';

import '../../../constants.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      color: greenColor.withOpacity(0.1),
      child: Row(
        children: [
          Expanded(
            child: MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');

                // Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 100,
                child: Stack(
                  children: [
                    Center(
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              color: greenColor,
              elevation: 0,
            ),
          ),
          SizedBox(width: 15),
          IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Added to Cart'),
                  backgroundColor: greenColor,
                  duration: Duration(milliseconds: 1200),
                ));
              },
              icon: Icon(
                Icons.favorite_border_outlined,
                color: Colors.grey,
                size: 30,
              )),
        ],
      ),
    );
  }
}
