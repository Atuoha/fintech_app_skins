import 'package:fintech_app_ui/components/exchange_container.dart';
import 'package:fintech_app_ui/constants/color.dart';
import 'package:flutter/material.dart';

import '../../components/virtual_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 80,
      ),
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.6, 0.8),
          end: FractionalOffset(0.9, 0.0),
          stops: [0.4, 0.4],
          tileMode: TileMode.clamp,
          colors: [
            Colors.white,
            primaryColor,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Welcome Back,',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            'Ujunwa Peace',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          ExchangeContainer(),
          Center(
            child: VirtualCard(
              cardColor: 'other',
              cardName: 'Ujunwa Peace',
              cardNumber: '2345 5678 5432 456',
              expiry: '07/25',
              isMaster: true,
            ),
          )
        ],
      ),
    );
  }
}
