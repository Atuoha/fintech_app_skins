import 'dart:async';
import 'package:fintech_app_ui/screens/auth/signin.dart';
import 'package:fintech_app_ui/screens/auth/verify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../components/auth_header.dart';
import '../../components/inline_text_buttton.dart';
import '../../components/kElevatedButton.dart';
import '../../constants/color.dart';

class Signup extends StatefulWidget {
  static const routeName = '/signup';

  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

enum Field { name, email, phone, password, pin }

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _securityPinController = TextEditingController();
  var obscure = true;
  var loading = false;
  final double kSize = 100;

  // textfield for all inputs
  Widget kTextField(TextEditingController controller, Field field, String label,
      String hint) {
    return TextFormField(
      textInputAction:
          field == Field.pin ? TextInputAction.done : TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          switch (field) {
            case Field.name:
              if (value.length < 3) return 'Invalid fullname';
              break;
            case Field.email:
              if (!value.contains('@')) return 'Email is invalid';
              break;
            case Field.pin:
              if (value.length < 4) return 'Pin should be four number';
              break;

            case Field.password:
              if (value.length < 8) return 'Password is not strong';
              break;
            case Field.phone:
              if (value.length < 10) return 'Invalid phone number';
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
          : field == Field.phone
              ? TextInputType.phone
              : field == Field.pin
                  ? TextInputType.number
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
      // Un-focus Keyboard
      FocusScope.of(context).unfocus();

      setState(() {
        loading = true;
      });
    }

    // TODO : implement Registration
    Timer(const Duration(seconds: 5), () {
      Navigator.of(
        context,
      ).pushNamed(
        VerificationScreen.routeName,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthHeader(
                header: 'Welcome,',
                content: 'Create your account to get started',
              ),
              const SizedBox(height: 40),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    kTextField(
                      _fullNameController,
                      Field.name,
                      'FullName',
                      'User',
                    ),
                    const SizedBox(height: 20),
                    kTextField(
                      _emailController,
                      Field.email,
                      'Email Address',
                      'user@gmail.com',
                    ),
                    const SizedBox(height: 20),
                    kTextField(
                      _phoneNumberController,
                      Field.phone,
                      'Phone',
                      '23480000000',
                    ),
                    const SizedBox(height: 20),
                    kTextField(
                      _passwordController,
                      Field.password,
                      'Password',
                      '********',
                    ),
                    const SizedBox(height: 20),
                    kTextField(
                      _securityPinController,
                      Field.pin,
                      'Security Pin (4 digits)',
                      '0000',
                    ),
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
                          title: 'Continue',
                          icon: Icons.chevron_left,
                          action: () => _submitForm(context),
                        ),
                        const SizedBox(height: 10),
                        const InlineTextButton(
                          routeName: Signin.routeName,
                          firstText: 'Already have an account? ',
                          secondText: 'Sign in',
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
