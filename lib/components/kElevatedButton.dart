import 'package:flutter/material.dart';
import '../constants/color.dart';

class kElevatedButton extends StatelessWidget {
  const kElevatedButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.action,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: primaryColor,
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 15,
          ),
        ),
        onPressed: () => action(),
        icon: Icon(icon),
        label: Text(title),
      ),
    );
  }
}
