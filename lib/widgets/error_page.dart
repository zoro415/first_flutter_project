import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorPage extends StatelessWidget {
  ErrorPage({required this.errorMessage, required this.onRetry, Key? key})
      : super(key: key);

  final String errorMessage;
  VoidCallback onRetry;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/lottie/error-animation.json', width: 150),
          Text(errorMessage),
          ElevatedButton(
            onPressed: onRetry, child: Text('Try Again'),
            // style: ButtonStyle(backgroundColor: MaterialStateColor(greenColor),),
          )
        ],
      ),
    );
  }
}
