import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/color.dart';

class SubscriptionDetails extends StatelessWidget {
  static const routeName = '/subdetails';
  const SubscriptionDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Subscriptions',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: primaryColor,
          ),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.chevron_left,
              color: primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
