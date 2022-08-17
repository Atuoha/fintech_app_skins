import 'package:fintech_app_ui/constants/color.dart';
import 'package:fintech_app_ui/providers/history.dart';
import 'package:fintech_app_ui/providers/payment.dart';
import 'package:fintech_app_ui/providers/subscription.dart';
import 'package:fintech_app_ui/providers/transaction.dart';
import 'package:fintech_app_ui/providers/virtual_card.dart';
import 'package:fintech_app_ui/screens/auth/forgot_password.dart';
import 'package:fintech_app_ui/screens/auth/signin.dart';
import 'package:fintech_app_ui/screens/auth/signup.dart';
import 'package:fintech_app_ui/screens/auth/verify.dart';
import 'package:fintech_app_ui/screens/main/bottom_nav.dart';
import 'package:fintech_app_ui/screens/splash/entry_screen.dart';
import 'package:fintech_app_ui/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const FinTechApp());
}

class FinTechApp extends StatelessWidget {
  const FinTechApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => VirtualCardData(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionData(),
        ),
        ChangeNotifierProvider(
          create: (context) => HistoryData(),
        ),
        ChangeNotifierProvider(
          create: (context) => SubscriptionData(),
        ),
        ChangeNotifierProvider(
          create: (context) => PaymentData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins', primaryColor: primaryColor),
        title: 'Fintech App',
        home: const EntryScreen(),
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          Signup.routeName: (context) => const Signup(),
          VerificationScreen.routeName: (context) => const VerificationScreen(),
          Signin.routeName: (context) => const Signin(),
          ForgotPassword.routeName: (context) => const ForgotPassword(),
          BottomNav.routeName: (context) => const BottomNav(),
        },
      ),
    );
  }
}
