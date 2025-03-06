import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:multi_store/auth/customer_login.dart';
import 'package:multi_store/auth/customer_signup.dart';
import 'package:multi_store/main_screens/customer_home.dart';
import 'package:multi_store/main_screens/supplier_home.dart';
import 'package:multi_store/main_screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home:WelcomeScreen(),
      initialRoute: "welcome_screen",
      routes: {
        "welcome_screen": (context) => WelcomeScreen(),
        "customer_home": (context) => CustomerHomeScreen(),
        "supplier_home": (context) => SupplierHomeScreen(),
        "customer_signup": (context) => CustomerRegister(),
        "customer_login": (context) => CustomerLogin(),
      },
    );
  }
}
