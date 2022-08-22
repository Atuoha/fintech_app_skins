import 'package:fintech_app_ui/constants/color.dart';
import 'package:fintech_app_ui/providers/history.dart';
import 'package:fintech_app_ui/providers/payment.dart';
import 'package:fintech_app_ui/providers/subscription.dart';
import 'package:fintech_app_ui/providers/transaction.dart';
import 'package:fintech_app_ui/providers/virtual_card.dart';
import 'package:fintech_app_ui/route/route.dart';
import 'package:fintech_app_ui/screens/splash/entry_screen.dart';
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
        theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: primaryColor,
        ),
        title: 'Fintech App',
        home: const EntryScreen(),
        routes: routes,
      ),
    );
  }
}
