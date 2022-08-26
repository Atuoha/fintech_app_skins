import 'package:fintech_app_ui/providers/virtual_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VirtualCardUI extends StatefulWidget {
  const VirtualCardUI({
    Key? key,
    required this.id,
    required this.cardColor,
    required this.cardName,
    required this.cardNumber,
    required this.expiry,
    required this.isMaster,
    required this.amount,
  }) : super(key: key);
  final String id;
  final String cardColor;
  final String cardName;
  final bool isMaster;
  final String expiry;
  final String cardNumber;
  final double amount;

  @override
  State<VirtualCardUI> createState() => _VirtualCardUIState();
}

class _VirtualCardUIState extends State<VirtualCardUI> {
  var showAmount = true;

  // toggle show amount
  _toggleShowAmount() {
    Provider.of<VirtualCardData>(
      context,
      listen: false,
    ).toggleCardAmountVisibility(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    var amountVisibility = Provider.of<VirtualCardData>(
      context,
      listen: false,
    ).getCardAmountVisibility(widget.id);
    return Stack(
      children: [
        // Card Type
        Image.asset(
          widget.cardColor == 'red'
              ? 'assets/images/card2.png'
              : widget.cardColor == 'green'
                  ? 'assets/images/card3.png'
                  : widget.cardColor == 'black'
                      ? 'assets/images/card5.png'
                      : widget.cardColor == 'blue'
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

        // Card Available Amount and Show amount operation
        Positioned(
          top: 10,
          left: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Card Amount
              Text(
                amountVisibility ? 'N${widget.amount}' : '*****',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),

              // Show Amount Operation
              IconButton(
                onPressed: () => _toggleShowAmount(),
                icon: Icon(
                  amountVisibility
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),

        // Card Type
        Positioned(
          bottom: 20,
          right: 10,
          child: Image.asset(
            widget.isMaster
                ? 'assets/images/master_card.png'
                : 'assets/images/visa_card.png',
          ),
        ),

        // Card Name
        Positioned(
          bottom: 40,
          left: 30,
          child: Text(
            widget.cardName,
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
            widget.expiry,
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
            widget.cardNumber,
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
