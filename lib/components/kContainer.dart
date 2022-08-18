import 'package:flutter/material.dart';

class KContainer extends StatelessWidget {
  const KContainer({
    Key? key,
    required this.iconBg,
    required this.color,
    required this.text,
    required this.icon,
  }) : super(key: key);
  final Color iconBg;
  final Color color;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 70,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Icon(
              icon,
              color: iconBg,
              size: 35,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(text,textAlign: TextAlign.center,)
      ],
    );
  }
}
