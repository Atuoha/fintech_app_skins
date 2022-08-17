import 'package:flutter/material.dart';
import '../constants/color.dart';

class InlineTextButton extends StatelessWidget {
  const InlineTextButton({
    Key? key,
    required this.routeName,
    required this.firstText,
    required this.secondText,
  }) : super(key: key);
  final String routeName;
  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(routeName),
        child: RichText(
          text: TextSpan(
            text: firstText,
            style: const TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: secondText,
                style: const TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
