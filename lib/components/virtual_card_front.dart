import 'package:flutter/material.dart';

class VirtualCard extends StatelessWidget {
  const VirtualCard({
    Key? key,
    required this.cardColor,
    required this.cardName,
    required this.cardNumber,
    required this.expiry,
    required this.isMaster,
  }) : super(key: key);
  final String cardColor;
  final String cardName;
  final bool isMaster;
  final String expiry;
  final String cardNumber;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Card Type
        Image.asset(
          cardColor == 'red'
              ? 'assets/images/card2.png'
              : cardColor == 'green'
                  ? 'assets/images/card3.png'
                  : cardColor == 'black'
                      ? 'assets/images/card5.png'
                      : cardColor == 'blue'
                          ? 'assets/images/card4.png'
                          : 'assets/images/card1.png',
          width: 300,
        ),

        // Company Logo
        Positioned(
          top: 20,
          right: 10,
          child: Image.asset(
            'assets/images/logo.png',
            width: 150,
          ),
        ),

        // Card Type
        Positioned(
          bottom: 20,
          right: 10,
          child: Image.asset(
            isMaster
                ? 'assets/images/master_card.png'
                : 'assets/images/visa_card.png',
          ),
        ),

        // Card Name
        Positioned(
          bottom: 40,
          left: 30,
          child: Text(
            cardName,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        // Card Date
        Positioned(
          bottom: 40,
          left: 150,
          child: Text(
            expiry,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        // Card Number
        Positioned(
          bottom: 70,
          left: 40,
          child: Text(
            cardNumber,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
