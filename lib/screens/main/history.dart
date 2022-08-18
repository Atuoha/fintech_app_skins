import 'package:flutter/material.dart';

import '../../components/searchbox.dart';
import '../../constants/color.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 18,
        right: 18,
        top: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'History',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: primaryColor,
            ),
          ),
          SizedBox(height: 10),
          SearchBox()
        ],
      ),
    );
  }
}
