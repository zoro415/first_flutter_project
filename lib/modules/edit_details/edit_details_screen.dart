// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/modules/edit_details/edit_profile_controller.dart';
import 'package:grocery_nepal/widgets/custom_button.dart';
import 'package:grocery_nepal/widgets/input_field.dart';
import 'package:grocery_nepal/widgets/loading.dart';

class EditDetailsScreen extends StatelessWidget {
  const EditDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditProfileController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            children: [
              InputField(
                'FullName',
                inputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                controller: controller.nameController,
              ),
              SizedBox(
                height: 30,
              ),
              InputField(
                'Email',
                inputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                controller: controller.emailController,
              ),
              SizedBox(
                height: 30,
              ),
              Obx(
                () => controller.isLoading.isTrue
                    ? Loading(
                        size: 50,
                      )
                    : CustomButton('Update', () {
                        controller.editProfile();
                      }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
