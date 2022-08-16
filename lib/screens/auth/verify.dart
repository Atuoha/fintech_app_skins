import 'dart:async';
import 'package:fintech_app_ui/components/kElevatedButton.dart';
import 'package:fintech_app_ui/screens/auth/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../components/auth_header.dart';
import '../../constants/color.dart';

class VerificationScreen extends StatefulWidget {
  static const routeName = '/verification';

  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController textEditingController = TextEditingController();

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

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
                    'Please enter the 4 digits verification code \n sent to you using 23481*********267',
              ),
              const SizedBox(height: 40),
              Form(
                key: _formKey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 30,
                    ),
                    child: PinCodeTextField(

                      appContext: context,
                      pastedTextStyle: const TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 4,
                      obscureText: true,
                      obscuringCharacter: '*',

                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v!.length < 3) {
                          return "Invalid verification pin";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                        selectedColor: primaryColor,
                        selectedFillColor: primaryColor,
                        errorBorderColor: masterYellow,
                        disabledColor: masterYellow,
                        inactiveColor: primaryColor,
                        activeColor: primaryColor,
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor: Colors.white,
                      ),
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: textEditingController,
                      keyboardType: TextInputType.number,
                      boxShadows: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) {
                        debugPrint("Completed");
                      },

                      onChanged: (value) {
                        debugPrint(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text");
                        return true;
                      },
                    )),
              ),

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
