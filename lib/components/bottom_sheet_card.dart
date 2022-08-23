import 'dart:async';

import 'package:fintech_app_ui/components/kElevatedButton.dart';
import 'package:fintech_app_ui/components/virtual_card_back.dart';
import 'package:fintech_app_ui/components/virtual_card_front.dart';
import 'package:fintech_app_ui/model/virtual_card.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import '../constants/color.dart';
import '../providers/virtual_card.dart';

class CardBottomSheet extends StatefulWidget {
  const CardBottomSheet({
    Key? key,
    required this.card,
  }) : super(key: key);
  final VirtualCard card;

  @override
  State<CardBottomSheet> createState() => _CardBottomSheetState();
}

class _CardBottomSheetState extends State<CardBottomSheet> {
  // this shows whether the card is showing the front or the back
  var cardFront = true;
  var _isLoading = false;
  final double kSize = 100;

  toggleCardFace() {
    setState(() {
      cardFront = !cardFront;
    });
  }

  @override
  Widget build(BuildContext context) {
    var cardProvider = Provider.of<VirtualCardData>(context);

    // loadingAction
    loadingAction() {
      setState(() {
        _isLoading = true;
      });
      Timer(const Duration(seconds: 5), () {
        Navigator.of(context).pop();
      });
    }

    // toggling card activation
    _toggleCardActivation() {
      cardProvider.toggleActivation(widget.card.id);
      loadingAction();
    }

    // terminate card
    _terminate() {
      cardProvider.deleteCard(widget.card.id);
      loadingAction();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => toggleCardFace(), // for switching card face
          child: Center(
            child: cardFront
                ? VirtualCardUI(
                    cardColor: widget.card.cardColor,
                    cardName: widget.card.cardName,
                    cardNumber: widget.card.cardNumber,
                    expiry: widget.card.expiry,
                    isMaster: widget.card.isMaster,
                  )
                : VirtualCardBack(cvc: widget.card.cvc),
          ),
        ),
        const SizedBox(height: 10),
        _isLoading
            ? Center(
                child: LoadingAnimationWidget.fourRotatingDots(
                  color: primaryColor,
                  size: kSize,
                ),
              )
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.card.isActive
                      ? KElevatedButton(
                          title: 'Inactivate',
                          icon: Icons.check_circle,
                          action: _toggleCardActivation,
                        )
                      : KElevatedButton(
                          title: 'Activate',
                          icon: Icons.check_circle,
                          action: _toggleCardActivation,
                        ),
                 const  SizedBox(width:10),
                  KElevatedButton(
                    title: 'Terminate',
                    icon: Icons.clear,
                    action: _terminate,
                  ),
                ],
              )
      ],
    );
  }
}
