// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:grocery_nepal/app_controller.dart';
import 'package:grocery_nepal/modules/auth/change_password/change_password_screen.dart';
import 'package:grocery_nepal/modules/contact_us_screen.dart/contact_us_screen.dart';
import 'package:grocery_nepal/modules/edit_details/edit_details_screen.dart';
import 'package:grocery_nepal/modules/favourites/favourite_screen.dart';
import 'package:grocery_nepal/modules/profile_tab/about_us/about_us_screen.dart';
import 'package:grocery_nepal/modules/profile_tab/widgets/item_tile.dart';
import 'package:grocery_nepal/modules/profile_tab/widgets/login_button.dart';
import 'package:grocery_nepal/modules/profile_tab/widgets/logout_button.dart';
import 'package:grocery_nepal/modules/profile_tab/widgets/user_detail_bar.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final appController = Get.find<AppController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () => appController.isLoggedIn.isFalse
                  ? Divider(
                      thickness: 1,
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        UserDetailBar(),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        ItemTile(
                          icon: Icons.favorite_outline,
                          label: 'Favourites',
                          onPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FavouriteScreen()));
                          },
                        ),
                        ItemTile(
                          icon: Icons.edit_outlined,
                          label: 'Edit Profile',
                          onPress: () {
                            Get.to(EditDetailsScreen());
                          },
                        ),
                        ItemTile(
                          icon: Icons.lock_outline,
                          label: 'Change Password',
                          onPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ChangePasswordScreen()));
                          },
                        ),
                      ],
                    ),
            ),
            ItemTile(
              icon: Icons.info_outline,
              label: 'About Us',
              onPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUsScreen()));
              },
            ),
            ItemTile(
              icon: Icons.feedback_outlined,
              label: 'Contact Us',
              onPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactUsScreen()));
              },
            ),
            SizedBox(
              height: 40,
            ),
            Obx(() => appController.isLoggedIn.isFalse
                ? LoginButton()
                : LogoutButton()),
          ],
        ),
      ),
    );
  }
}
