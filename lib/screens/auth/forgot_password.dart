import 'dart:async';
import 'package:fintech_app_ui/screens/auth/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../components/auth_header.dart';
import '../../components/inline_text_buttton.dart';
import '../../components/kElevatedButton.dart';
import '../../constants/color.dart';

class ForgotPassword extends StatefulWidget {
  static const routeName = '/forgotpassword';
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();
  var loading = false;
  final double kSize = 100;

  _submitForm(BuildContext context) {
    setState(() {
      loading = true;
    });

    // TODO : implement Forgot Password
    Timer(const Duration(seconds: 5), () {
      Navigator.of(
        context,
      ).pushNamed(Signin.routeName);
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthHeader(
                header: 'Howdy,',
                content: 'Enter email to retrieve password',
              ),
              const SizedBox(height: 60),
              TextFormField(
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Email is not valid';
                  }
                  return null;
                },
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'user@gmail.com',
                  label: const Text('Email'),
                  labelStyle: const TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w200,
                    fontSize: 18,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      width: 1,
                      color: greyShade1,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: primaryColor,
                    ),
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
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        KElevatedButton(
                          title: 'Confirm',
                          icon: Icons.chevron_left,
                          action: () => _submitForm(context),
                        ),
                        const SizedBox(height: 10),
                        const InlineTextButton(
                          routeName: Signin.routeName,
                          firstText: 'Remembered password? ',
                          secondText: 'Sign in',
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
