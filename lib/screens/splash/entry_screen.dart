import 'dart:async';
import 'package:fintech_app_ui/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import '../../constants/color.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({Key? key}) : super(key: key);

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  var loading = true;
  final double kSize = 100;

  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 50), () {
      Navigator.of(context).pushNamed(SplashScreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      constraints: const BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/image/logo.png'),
          const SizedBox(height: 20),
          LoadingAnimationWidget.flickr(
            leftDotColor: masterRed,
            rightDotColor: masterYellow,
            size: kSize,
          ),
        ],
      ),
    );
  }
}
