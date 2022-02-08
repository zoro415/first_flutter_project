import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/sockets/src/socket_notifier.dart';
import 'package:grocery_nepal/data/api/auth_api.dart';

import '../../../app_controller.dart';

class RegisterConrtoller extends GetxController {
  final isLoading = false.obs;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> register() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confrimPassword = confirmPasswordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      Get.rawSnackbar(message: 'All Fields are required');
      return;
    }

    if (confrimPassword != password) {
      Get.rawSnackbar(message: "Passwords didnot match");
      return;
    }

    isLoading(true);
    try {
      var response =
          await AuthApi.register(name: name, email: email, password: password);
      isLoading(false);
      Get.back();
      Get.back();
      Get.rawSnackbar(message: 'Register successful');
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
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
