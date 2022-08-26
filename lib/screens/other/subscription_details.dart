import 'dart:async';
import 'dart:math';

import 'package:fintech_app_ui/providers/subscription.dart';
import 'package:fintech_app_ui/screens/other/response_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import '../../components/kElevatedButton.dart';
import '../../components/virtual_card_back.dart';
import '../../components/virtual_card_front.dart';
import '../../constants/color.dart';
import '../../providers/virtual_card.dart';

class SubscriptionDetails extends StatefulWidget {
  static const routeName = '/subdetails';

  const SubscriptionDetails({Key? key}) : super(key: key);

  @override
  State<SubscriptionDetails> createState() => _SubscriptionDetailsState();
}

class _SubscriptionDetailsState extends State<SubscriptionDetails> {
  // this shows whether the card is showing the front or the back
  var cardFront = true;
  var obscure = true;
  final _pinController = TextEditingController();
  var isLoading = false;
  final double kSize = 100;
  var transId = Random().nextInt(888);
  final _formKey = GlobalKey<FormState>();

  toggleCardFace() {
    setState(() {
      cardFront = !cardFront;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _pinController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  _subscribe(String service, var amount) {
    var valid = _formKey.currentState!.validate();

    if (valid) {
      //  TODO: Implement subscription

      setState(() {
        isLoading = true;
      });

      // balance holding balance from provider
      var balance = Provider.of<VirtualCardData>(
        context,
        listen: false,
      ).getBalance();

      var message = '';
      var status = false;
      var amountParsed = double.parse(amount.toString());

      if (amountParsed > balance) {
        message =
            'Your subscription for $service can not be confirmed. Due to insufficient balance';
        status = false;
      } else {
        message =
            'Your subscription for $service has been confirmed. You should receive a notification any moment';
        status = true;

        // withdraw from balance
        Provider.of<VirtualCardData>(
          context,
          listen: false,
        ).withdrawFromBalance(
          amountParsed,
        );
      }

      // timer
      Timer(const Duration(seconds: 5), () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ResponseScreen(
              successStatus: status,
              message: message,
              amount: amountParsed,
              transId: 'swift-$transId',
            ),
          ),
        );
      });
    } else {
      return null;
    }
  }

  _termsOfUse() {
    // TODO: Redirect to terms of use page
    if (kDebugMode) {
      print('Terms of use');
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

    var data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var id = data['id'] as int;
    var subscription = Provider.of<SubscriptionData>(context).findById(id);
    var activeCard = Provider.of<VirtualCardData>(context).getActiveCard();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Subscriptions',
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
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(subscription.imgAsset),
                  Column(
                    children: [
                      Text(
                        subscription.title,
                        style: const TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Family Plan',
                        style: TextStyle(
                          color: greyShade1,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: const [
                          Icon(
                            Icons.calendar_month,
                            color: masterYellow,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Date added',
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        DateFormat('MMMEd').format(subscription.date),
                        style: const TextStyle(
                          color: greyShade1,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Amount',
                    style: TextStyle(
                      color: primaryColor,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'N${subscription.amount}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Charge',
                        style: TextStyle(
                          color: greyShade1,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const Text(
                'Payment method',
                style: TextStyle(color: primaryColor),
              ),
              InkWell(
                onTap: () => toggleCardFace(), // for switching card face
                child: Center(
                  child: cardFront
                      ? VirtualCardUI(
                          cardColor: activeCard.cardColor,
                          cardName: activeCard.cardName,
                          cardNumber: activeCard.cardNumber,
                          expiry: activeCard.expiry,
                          isMaster: activeCard.isMaster,
                      amount: activeCard.balanceAmount
                        )
                      : VirtualCardBack(cvc: activeCard.cvc),
                ),
              ),
              const SizedBox(height: 10),
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: _pinController,
                  obscureText: obscure,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value!.length < 3 || value.length > 4) {
                      return 'Pin must be 4 characters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    suffixIcon: _pinController.text.isNotEmpty
                        ? IconButton(
                            onPressed: () => setState(() {
                              obscure = !obscure;
                            }),
                            icon: Icon(
                              obscure ? Icons.visibility : Icons.visibility_off,
                              color: primaryColor,
                            ),
                          )
                        : const Text(''),
                    label: const Text(
                      '4 Digit Pin',
                      style: TextStyle(
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
                ),
              ),
              const SizedBox(height: 20),
              isLoading
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
                          title: 'Subscribe',
                          icon: Icons.check_circle,
                          action:
                          ()=>_subscribe(subscription.title, subscription.amount),
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: GestureDetector(
                            onTap: () => _termsOfUse,
                            child: RichText(
                              text: const TextSpan(
                                text:
                                    'By clicking "subscribe", you \n agree to our ',
                                style: TextStyle(
                                  color: greyShade1,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Terms of Use',
                                    style: TextStyle(
                                        color: primaryColor,
                                        decoration: TextDecoration.underline,
                                        decorationColor: primaryColor),
                                  ),
                                ],
                              ),
                            ),
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
