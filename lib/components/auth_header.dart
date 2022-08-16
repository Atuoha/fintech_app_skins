import 'package:flutter/material.dart';
import '../constants/color.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    Key? key,
    required this.header,
    required this.content,
  }) : super(key: key);
  final String header;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: const TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        Text(
          content,
          style: const TextStyle(color: primaryColor),
        ),
      ],
    );
  }
}
