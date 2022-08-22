import 'dart:math';
import 'package:fintech_app_ui/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../components/kElevatedButton.dart';
import '../../components/virtual_card_back.dart';
import '../../components/virtual_card_front.dart';

class AddNewCard extends StatefulWidget {
  static const routeName = '/newCard';

  const AddNewCard({Key? key}) : super(key: key);

  @override
  State<AddNewCard> createState() => AddNewCardState();
}

enum Field { password, pin, cardType, cardColor }

class AddNewCardState extends State<AddNewCard> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _pinController = TextEditingController();
  final _cardTypes = ['Mastercard', 'Visa'];
  var currentCardType = 'Visa';
  final _cardColors = ['red', 'green', 'black', 'blue', 'other'];
  var currentCardColor = 'blue';
  var string = "Please be sure your BVN \nis linked with your account";

  // this shows whether the card is showing the front or the back
  var cardFront = true;
  var passwordObscure = true;
  var pinObscure = true;
  int cvc = Random().nextInt(888);

  // var cardNumber // this should be generated
  var bvnLinkingVisible = true;

  toggleCardFace() {
    setState(() {
      cardFront = !cardFront;
    });
  }

  removeBvnNotice() {
    setState(() {
      bvnLinkingVisible = !bvnLinkingVisible;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _passwordController.addListener(() {
      setState(() {});
    });
    _pinController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  // custom dropdown for card types and card color
  Widget kDropDownField(
    String title,
    String dataValue,
    List<String> list,
    Field field,
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
        switch (field) {
          case Field.cardType:
            setState(() {
              currentCardType = value.toString();
            });
            break;
          case Field.cardColor:
            setState(() {
              currentCardColor = value.toString();
            });
            break;
        }

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
          field == Field.pin ? TextInputType.number : TextInputType.text,
      textInputAction:
          field == Field.pin ? TextInputAction.next : TextInputAction.done,
      validator: (value) {
        switch (field) {
          case Field.password:
            if (value!.length < 8) {
              return 'Password is not strong';
            }
            break;

          case Field.pin:
            if (value!.length < 3 || value.length > 4) {
              return 'Pin must be 4 characters';
            }
            break;
        }

        return null;
      },
      decoration: InputDecoration(
        suffixIcon: controller.text.isNotEmpty
            ? IconButton(
                onPressed: () => setState(() {
                  if (field == Field.password) {
                    passwordObscure = !passwordObscure;
                  } else {
                    pinObscure = !pinObscure;
                  }
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

  // submitForm
  submitForm() {
    // var valid = _formKey.currentState!.validate();
    // if (!valid) {
    //   return null;
    // }

    // request for new card
    print(currentCardColor);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Request Card',
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
            children: [
              bvnLinkingVisible
                  ? Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 5,
                      ),
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: masterYellow,
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () => removeBvnNotice(),
                              child: const Icon(
                                Icons.clear,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                string,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                'Link BVN',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  : const Text(''),
              InkWell(
                onTap: () => toggleCardFace(), // for switching card face
                child: Center(
                  child: cardFront
                      ? VirtualCardUI(
                          cardColor: currentCardColor,
                          cardName: 'Ujunwa Peace',
                          cardNumber: '6786 5435 8907 3424',
                          expiry: '08/26',
                          isMaster:
                              currentCardType == 'Mastercard' ? true : false,
                        )
                      : VirtualCardBack(cvc: cvc),
                ),
              ),
              const SizedBox(height: 15),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'Processing fee - 1,500.00',
                        style: TextStyle(
                          color: primaryColor,
                        ),
                      ),
                    ),
                    kDropDownField('Select card type', currentCardType,
                        _cardTypes, Field.cardType),
                    const SizedBox(height: 20),
                    kDropDownField('Select card color', currentCardColor,
                        _cardColors, Field.cardColor),
                    const SizedBox(height: 20),
                    kTextField(
                      _passwordController,
                      'Password',
                      passwordObscure,
                      Field.password,
                    ),
                    const SizedBox(height: 20),
                    kTextField(
                      _pinController,
                      '4 Digit Pin',
                      pinObscure,
                      Field.pin,
                    ),
                    const SizedBox(height: 20),
                    KElevatedButton(
                      title: 'Request card',
                      icon: Icons.check_circle,
                      action: submitForm,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
