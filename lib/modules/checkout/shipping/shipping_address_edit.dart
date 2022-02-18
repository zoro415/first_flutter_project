import 'package:flutter/material.dart';
import 'package:grocery_nepal/widgets/custom_button.dart';
import 'package:grocery_nepal/widgets/input_field.dart';

class ShippingAddressEdit extends StatefulWidget {
  ShippingAddressEdit({Key? key}) : super(key: key);

  @override
  State<ShippingAddressEdit> createState() => _ShippingAddressEditState();
}

class _ShippingAddressEditState extends State<ShippingAddressEdit> {
  final List<String> provinces = [
    "Province 1",
    "Madesh",
    "Bagmati",
    "Lumbini",
    "Karnali",
    "Sudur Pashchim",
  ];
  String? selectedProvince;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shipping Address"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 15,
          ),
          child: Column(
            children: [
              InputField(
                "Phone Number",
                inputType: TextInputType.phone,
                textInputAction: TextInputAction.next,
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                    labelText: "Province",
                    labelStyle: TextStyle(
                      color: Colors.green,
                    )),
                value: selectedProvince,
                items: provinces
                    .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                              child: Text(value),
                              value: value,
                            ))
                    .toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedProvince = newValue;
                  });
                },
              ),
              InputField(
                "City",
                textInputAction: TextInputAction.next,
              ),
              InputField(
                "Address",
                inputType: TextInputType.streetAddress,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton("Update", () {
                Navigator.pop(context);
              })
            ],
          ),
        ),
      ),
    );
  }
}
