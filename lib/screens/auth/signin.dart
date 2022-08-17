import 'dart:async';
import 'package:fintech_app_ui/screens/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../components/auth_header.dart';
import '../../components/inline_text_buttton.dart';
import '../../components/kElevatedButton.dart';
import '../../constants/color.dart';
import '../main/bottom_nav.dart';
import 'forgot_password.dart';

class Signin extends StatefulWidget {
  static const routeName = '/signin';

  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

enum Field { email, password }

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var obscure = true;
  var loading = false;
  final double kSize = 100;
  var rememberMe = false;

  // textfield for all inputs
  Widget kTextField(TextEditingController controller, Field field, String label,
      String hint) {
    return TextFormField(
      textInputAction:
          field == Field.password ? TextInputAction.done : TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          switch (field) {
            case Field.email:
              if (!value.contains('@')) return 'Email is invalid';
              break;

            case Field.password:
              if (value.length < 8) return 'Password is not strong';
              break;
          }
          return '$field must be approved!';
        }

        return null;
      },
      // maxLength: field == Field.pin ?4:40,
      controller: controller,
      obscureText: field == Field.password ? obscure : false,
      keyboardType: field == Field.email
          ? TextInputType.emailAddress
          : TextInputType.text,
      decoration: InputDecoration(
        suffixIcon: field == Field.password
            ? _passwordController.text.isNotEmpty
                ? IconButton(
                    onPressed: () => setState(() {
                      obscure = !obscure;
                    }),
                    icon: Icon(
                      obscure
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  )
                : const Text('')
            : const Text(''),
        hintText: hint,
        label: Text(label),
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
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    _passwordController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  _submitForm(BuildContext context) {
    var valid = _formKey.currentState!.validate();
    if (!valid) {
      return null;
    } else {
      setState(() {
        loading = true;
      });
    }

    // TODO : implement Signin
    Timer(const Duration(seconds: 5), () {
      Navigator.of(
        context,
      ).pushNamed(BottomNav.routeName);
    });
  }

  _forgotPassword() {
    Navigator.of(context).pushNamed(ForgotPassword.routeName);
  }

  _fingerPrintSignin() {
    // TODO implement fingerprint signin
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
                header: 'Hi,',
                content: 'Sign in into your account',
              ),
              const SizedBox(height: 60),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    kTextField(
                      _emailController,
                      Field.email,
                      'Email Address',
                      'user@gmail.com',
                    ),
                    const SizedBox(height: 20),
                    kTextField(
                      _passwordController,
                      Field.password,
                      'Password',
                      '********',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Text(
                              'Remember me',
                              style: TextStyle(color: primaryColor),
                            ),
                            Checkbox(
                              side: const BorderSide(color:primaryColor),
                              activeColor: primaryColor,
                              value: rememberMe,
                              onChanged: (value) => setState(() {
                                rememberMe = value!;
                              }),
                            )
                          ],
                        ),
                        TextButton(
                          onPressed: () => _forgotPassword(),
                          child: const Text(
                            'Forgot password',
                            style: TextStyle(
                              color: masterYellow,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
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
                          title: 'Sign in',
                          icon: Icons.chevron_left,
                          action: () => _submitForm(context),
                        ),
                        const SizedBox(height: 10),
                        const InlineTextButton(
                          routeName: Signup.routeName,
                          firstText: 'Don\'t have an account? ',
                          secondText: 'Sign up',
                        ),
                        const SizedBox(height: 10),
                        TextButton.icon(
                          onPressed: () => _fingerPrintSignin,
                          icon: const Icon(
                            Icons.fingerprint,
                            color: primaryColor,
                          ),
                          label: const Text(
                            'Use fingerprint/face ID',
                            style: TextStyle(color: primaryColor),
                          ),
                        )
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
