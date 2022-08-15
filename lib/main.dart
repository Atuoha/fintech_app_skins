import 'package:fintech_app_ui/constants/color.dart';
import 'package:fintech_app_ui/screens/auth/signup.dart';
import 'package:fintech_app_ui/screens/splash/entry_screen.dart';
import 'package:fintech_app_ui/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FinTechApp());
}

class FinTechApp extends StatelessWidget {
  const FinTechApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins',primaryColor: primaryColor),
      title: 'Fintech App',
      home: const EntryScreen(),
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        Signup.routeName: (context)=> const Signup(),
      },
    );
  }
}
