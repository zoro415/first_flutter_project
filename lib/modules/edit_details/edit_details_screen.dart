import 'package:flutter/material.dart';
import 'package:grocery_nepal/widgets/custom_button.dart';
import 'package:grocery_nepal/widgets/input_field.dart';

class EditDetailsScreen extends StatelessWidget {
  const EditDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              ),
              SizedBox(
                height: 30,
              ),
              InputField(
                'Email',
                inputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(
                height: 30,
              ),
              CustomButton('Update', () {
                Navigator.pop(context);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
