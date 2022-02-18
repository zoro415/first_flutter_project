// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_nepal/app_controller.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/modules/auth/login/login_screen.dart';
import 'package:grocery_nepal/modules/auth/register/register_screen.dart';
import 'package:grocery_nepal/modules/favourites/favorite_controller.dart';
import 'package:grocery_nepal/modules/home/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'modules/cart_tab/cart_controller.dart';
import 'modules/order_tab/order_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var sharedPref = await SharedPreferences.getInstance();

  runApp(MyApp(sharedPref));
}

class MyApp extends StatelessWidget {
  MyApp(this.sharedPreferences, {Key? key}) : super(key: key);
  final SharedPreferences sharedPreferences;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Grocery Nepal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context)
              .textTheme, // If this is not set, then ThemeData.light().textTheme is used.
        ),
        appBarTheme: AppBarTheme(
          color: greenColor,
          elevation: 1,
          //for the status bar of our phone
          // systemOverlayStyle: SystemUiOverlayStyle(
          //     statusBarColor: Theme.of(context).scaffoldBackgroundColor,
          //     statusBarBrightness: Brightness.light,
          //     statusBarIconBrightness: Brightness.dark),
          centerTitle: true,
        ),
      ),
      initialRoute: '/',
      initialBinding: BindingsBuilder(() {
        Get.put(OrderTabConrtoller());
        Get.put(AppController(sharedPreferences), permanent: true);
        Get.put(FavoriteController(), permanent: true);
        Get.put(CartController(), permanent: true);
      }),
      routes: {
        '/': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => RegisterScreen(),
        // '/contact-us': (context) => const ContactScreen(),
      },
    );
  }
}
