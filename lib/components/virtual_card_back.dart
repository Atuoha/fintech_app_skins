import 'package:flutter/material.dart';

class VirtualCardBack extends StatelessWidget {
  const VirtualCardBack({Key? key, required this.cvc}) : super(key: key);
  final int cvc;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/card_back.png',
          width: 300,
        ),
        Positioned(
          top: 90,
          right: 30,
          left: 30,
          child: Text(
            'CVC $cvc',
            style: const TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
        )
      ],
    );
  }
}
