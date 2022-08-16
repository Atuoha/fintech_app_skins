import 'package:fintech_app_ui/constants/color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        children: [],
      ),
    );
  }
}
