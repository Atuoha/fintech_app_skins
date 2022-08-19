import 'package:fintech_app_ui/components/kElevatedButton.dart';
import 'package:fintech_app_ui/components/virtual_card_back.dart';
import 'package:fintech_app_ui/components/virtual_card_front.dart';
import 'package:fintech_app_ui/model/virtual_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  toggleCardFace() {
    setState(() {
      cardFront = !cardFront;
    });
  }

  @override
  Widget build(BuildContext context) {
    var cardProvider = Provider.of<VirtualCardData>(context);

    // toggling card activation
    _toggleCardActivation() {
      cardProvider.toggleActivation(widget.card.id);
      Navigator.of(context).pop();
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
              )
      ],
    );
  }
}
