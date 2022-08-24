import 'dart:async';
import 'package:fintech_app_ui/components/kElevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../components/balance_container.dart';
import '../../constants/color.dart';

class FundWallet extends StatefulWidget {
  static const routeName = '/fundwallet';

  const FundWallet({Key? key}) : super(key: key);

  @override
  State<FundWallet> createState() => _FundWalletState();
}

enum Field {
  password,
  amount,
}

class _FundWalletState extends State<FundWallet> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _amountController = TextEditingController();
  final sourceOfFunds = ['Select: ', 'Balance', 'Transfer'];
  var currentSource = 'Select: ';
  var passwordObscure = true;
  var isLoading = false;
  final double kSize = 100;

  @override
  void initState() {
    // TODO: implement initState
    _passwordController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  // submit form
  _submitForm() {
    var valid = _formKey.currentState!.validate();
    if (!valid) {
      return null;
    } else {
      //TODO: Implement Funding

      // isLoad action
      _isLoadingAction() {
        setState(() {
          isLoading = true;
        });

        Timer(const Duration(seconds: 5), () {
          Navigator.of(context).pop();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    // custom dropdown for card types and card color
    Widget kDropDownField(
      String title,
      String dataValue,
      List<String> list,
    ) {
      return DropdownButtonFormField(
        decoration: InputDecoration(
          label: Text(
            title,
            style: const TextStyle(
              color: primaryColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 1,
              color: primaryColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 1,
              color: greyShade2,
            ),
          ),
        ),
        value: dataValue,
        items: list
            .map(
              (data) => DropdownMenuItem(
                value: data,
                child: Text(data),
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            currentSource = value.toString();
          });
        },
      );
    }

    // custom textfield for password and pin
    Widget kTextField(
      TextEditingController controller,
      String text,
      bool obscure,
      Field field,
    ) {
      return TextFormField(
        controller: controller,
        obscureText: obscure,
        keyboardType:
            field == Field.amount ? TextInputType.number : TextInputType.text,
        textInputAction: field == Field.password
            ? TextInputAction.done
            : TextInputAction.next,
        validator: (value) {
          switch (field) {
            case Field.password:
              if (value!.length < 8) {
                return 'Password is not strong';
              }
              break;

            case Field.amount:
              if (value!.isEmpty) {
                return 'Amount can not be empty';
              }
              break;
          }

          return null;
        },
        decoration: InputDecoration(
          suffixIcon: controller.text.isNotEmpty
              ? IconButton(
                  onPressed: () => setState(() {
                    passwordObscure = !passwordObscure;
                  }),
                  icon: Icon(
                    obscure ? Icons.visibility : Icons.visibility_off,
                    color: primaryColor,
                  ),
                )
              : const Text(''),
          label: Text(
            text,
            style: const TextStyle(
              color: primaryColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 1,
              color: primaryColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 1,
              color: greyShade2,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Fund Wallet',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: primaryColor,
          ),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.chevron_left,
              color: primaryColor,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const BalanceContainer(),
              const SizedBox(height: 20),
              kTextField(
                _amountController,
                'Amount',
                false,
                Field.amount,
              ),
              const SizedBox(height: 20),
              kDropDownField(
                'Select Source',
                currentSource,
                sourceOfFunds,
              ),
              const SizedBox(height: 20),
              kTextField(
                _passwordController,
                'Password',
                passwordObscure,
                Field.password,
              ),
              const SizedBox(height: 20),
              isLoading
                  ? Center(
                      child: LoadingAnimationWidget.fourRotatingDots(
                        color: primaryColor,
                        size: kSize,
                      ),
                    )
                  : KElevatedButton(
                      title: 'Submit',
                      icon: Icons.check_circle,
                      action: () => _submitForm,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
