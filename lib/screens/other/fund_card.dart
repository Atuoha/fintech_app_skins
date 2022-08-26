import 'dart:async';
import 'dart:math';
import 'package:fintech_app_ui/components/kElevatedButton.dart';
import 'package:fintech_app_ui/providers/virtual_card.dart';
import 'package:fintech_app_ui/screens/other/response_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import '../../components/balance_container.dart';
import '../../constants/color.dart';

class FundCard extends StatefulWidget {
  static const routeName = '/fundwallet';

  const FundCard({Key? key}) : super(key: key);

  @override
  State<FundCard> createState() => _FundCardState();
}

enum Field {
  password,
  amount,
}

class _FundCardState extends State<FundCard> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _amountController = TextEditingController();
  final sourceOfFunds = ['Balance', 'Transfer'];
  var currentSource = 'Balance';
  var passwordObscure = true;
  var isLoading = false;
  final double kSize = 100;
  var transId = Random().nextInt(888);

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

      // Un-focus Keyboard
      FocusScope.of(context).unfocus();

      // isLoad action
      setState(() {
        isLoading = true;
      });

      // user password TODO: This will later implemented using auth provider
      var userPassword = Provider.of<VirtualCardData>(
        context,
        listen: false,
      ).getUserPassword();

      if (userPassword != _passwordController.text) {
        // show snackBar
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(seconds: 20),
          content: const Text(
            'Password Incorrect',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: primaryColor,
          action: SnackBarAction(
            onPressed: () => {},
            label: 'Dismiss',
            textColor: masterYellow,
          ),
        ));

        //reset loading
        setState(() {
          isLoading = false;
        });
      } else {
        var msg =
            'Your card has been funded. Debit will be through $currentSource.';
        Timer(const Duration(seconds: 5), () {
          Provider.of<VirtualCardData>(
            context,
            listen: false,
          ).fundActiveCard(
            double.parse(_amountController.text),
          );

          Provider.of<VirtualCardData>(
            context,
            listen: false,
          ).withdrawFromBalance(
            double.parse(_amountController.text),
          );

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ResponseScreen(
                successStatus: true,
                message: msg,
                amount: double.parse(_amountController.text),
                transId: 'swift-$transId',
              ),
            ),
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
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
          suffixIcon: field == Field.password
              ? controller.text.isNotEmpty
                  ? IconButton(
                      onPressed: () => setState(() {
                        passwordObscure = !passwordObscure;
                      }),
                      icon: Icon(
                        obscure ? Icons.visibility : Icons.visibility_off,
                        color: primaryColor,
                      ),
                    )
                  : const Text('')
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
          'Fund Card',
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
          child: Form(
            key: _formKey,
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
                        action: _submitForm,
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
