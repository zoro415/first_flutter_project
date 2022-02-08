import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  const Loading({this.size = 100, Key? key}) : super(key: key);
  final double size;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset('assets/lottie/loading-animation.json', width: size),
    );
  }
}
