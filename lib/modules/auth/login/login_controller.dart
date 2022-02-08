import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/sockets/src/socket_notifier.dart';
import 'package:grocery_nepal/data/api/auth_api.dart';

import '../../../app_controller.dart';

class LoginConrtoller extends GetxController {
  final isLoading = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.rawSnackbar(message: 'All Fields are required');
      return;
    }

    isLoading(true);
    try {
      var response = await AuthApi.login(username: email, password: password);
      isLoading(false);
      Get.back();
      Get.rawSnackbar(message: 'Login successful');
      Get.find<AppController>().login(response);
    } catch (e) {
      isLoading(false);
      String errorMessage;
      if (e.toString().contains("SocketException")) {
        errorMessage = "No Internet Connection";
      } else {
        // errorMessage = "Failed to load data";
        errorMessage = e.toString();
      }
      Get.rawSnackbar(message: errorMessage);
    }
  }

  @override
  void onClose() {
    passwordController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
