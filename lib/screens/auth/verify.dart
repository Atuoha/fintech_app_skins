import 'dart:async';
import 'package:fintech_app_ui/components/kElevatedButton.dart';
import 'package:fintech_app_ui/screens/auth/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../components/auth_header.dart';
import '../../constants/color.dart';

class VerificationScreen extends StatefulWidget {
  static const routeName = '/verification';

  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  var loading = false;
  final double kSize = 100;

  //verification
  _verify() {
    setState(() {
      loading = true;
    });
    // TODO implement verification

    Timer(const Duration(seconds: 5), () {
      Navigator.of(
        context,
      ).pushNamed(
        Signin.routeName,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 55,
          horizontal: 18,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AuthHeader(
                header: 'Account Verification',
                content:
                    'Please enter the 4 digits verification code \n sent to you using 830*********456',
              ),
              const SizedBox(height: 40),
              // TODO: Implement verification pin

              Center(
                child: RichText(
                  text: const TextSpan(
                    text: 'Expires in ',
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: '2:00',
                        style: TextStyle(color: masterYellow),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              loading
                  ? Center(
                      child: LoadingAnimationWidget.fourRotatingDots(
                        color: primaryColor,
                        size: kSize,
                      ),
                    )
                  : KElevatedButton(
                      title: 'Continue',
                      icon: Icons.chevron_left,
                      action: () => _verify(),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
