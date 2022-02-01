// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:grocery_nepal/constants.dart';
// import 'package:grocery_nepal/modules/profile_tab/widgets/form_input_field.dart';
// import 'package:grocery_nepal/widgets/custom_button.dart';
// import 'package:grocery_nepal/widgets/input_field.dart';
// import 'package:url_launcher/url_launcher.dart';

// class ContactUsScreen extends StatelessWidget {
//   const ContactUsScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Contact Us'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(15),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 FormInputField('Subject'),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 FormInputField(
//                   'Your Message',
//                   maxLines: 8,
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 CustomButton('Submit', () {
//                   launch("mailto:cheetizgurung@gmail.com");
//                 })
//               ],
//             ),
//           ),
//         ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatelessWidget {
  final inputDecoration = const InputDecoration(
    hintStyle: TextStyle(color: Colors.grey),
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    labelStyle: TextStyle(color: Colors.grey),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 1.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 1.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: greenColor, width: 1.5),
    ),
  );
  @override
  Widget build(BuildContext context) {
    String subject = '';
    String message = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          children: [
            const SizedBox(
              height: 15.0,
            ),
            TextField(
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.left,
              onChanged: (value) {
                subject = value;
              },
              decoration: inputDecoration.copyWith(labelText: 'Subject'),
            ),
            const SizedBox(
              height: 15.0,
            ),
            TextField(
                maxLines: 5,
                textInputAction: TextInputAction.done,
                textAlign: TextAlign.left,
                onChanged: (value) {
                  message = value;
                },
                decoration: inputDecoration.copyWith(labelText: 'Message')),
            const SizedBox(
              height: 24.0,
            ),
            CustomButton(
              'SEND',
              () {
                launch("mailto:cheetizgurung@gmail.com?subject=" +
                    subject +
                    "&body=" +
                    message);
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
