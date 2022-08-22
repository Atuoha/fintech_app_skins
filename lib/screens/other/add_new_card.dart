import 'package:fintech_app_ui/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../components/virtual_card_back.dart';
import '../../components/virtual_card_front.dart';
import '../../providers/virtual_card.dart';

class AddNewCard extends StatefulWidget {
  static const routeName = '/newCard';

  const AddNewCard({Key? key}) : super(key: key);

  @override
  State<AddNewCard> createState() => AddNewCardState();
}

class AddNewCardState extends State<AddNewCard> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _pinController = TextEditingController();

  final _cardTypes = ['Mastercard', 'Visa'];
  var currentCardType = 'Mastercard';

  var string = "Please be sure your BVN \nis linked with your account";

  // this shows whether the card is showing the front or the back
  var cardFront = true;
  var passwordObscure = true;
  var pinObscure = true;

  toggleCardFace() {
    setState(() {
      cardFront = !cardFront;
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

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    var activeCard = Provider.of<VirtualCardData>(context).getActiveCard();
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
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 12,
              ),
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: masterYellow,
              ),
              child: Row(
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
                      )
                    : VirtualCardBack(cvc: activeCard.cvc),
              ),
            ),
            const SizedBox(height: 15),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      label: const Text(
                        'Select card type',
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
                    value: currentCardType,
                    items: _cardTypes
                        .map(
                          (cardType) => DropdownMenuItem(
                            value: cardType,
                            child: Text(cardType),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        currentCardType = value.toString();
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
