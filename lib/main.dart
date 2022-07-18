import 'package:flutter/material.dart';
import 'pages/Signin_page.dart';
import 'pages/about_us_page.dart';
import 'pages/purchase_history_page.dart';
import 'pages/signup_page.dart';
import 'pages/home_page.dart';

late TextEditingController email;
late TextEditingController name;
late TextEditingController family;
late TextEditingController password;
Color orange = Color.fromRGBO(255, 128, 0, 1);
Color darkblue = Color.fromRGBO(40, 55, 147, 1);
Color lightblue = Color.fromRGBO(76, 89, 165, 1);
Color cartscolor = Colors.blueGrey;
String result = "";
String useremail = "";
var signinURL = 'http://192.168.43.217/market/Signin.php',
    SignupURL = 'http://192.168.43.217/market/Signup.php',
    shoppingURL = 'http://192.168.43.217/market/Shopping.php',
    purchaseshistoryURL = 'http://192.168.43.217/market/Purchaseshistory.php';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => SigninPage(),
      '/signup': (context) => SignupPage(),
      '/home': (context) => HomePage(),
      '/about_us': (context) => AboutUsPage(),
      '/purchase_history': (context) => PurchaseHistoryPage(),
    },
  ));
}
