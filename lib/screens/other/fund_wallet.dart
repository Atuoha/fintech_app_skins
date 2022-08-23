import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/color.dart';
class FundWallet extends StatefulWidget {
  static const routeName = '/fundwallet';
  const FundWallet({Key? key}) : super(key: key);

  @override
  State<FundWallet> createState() => _FundWalletState();
}

class _FundWalletState extends State<FundWallet> {
  @override
  Widget build(BuildContext context) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
      );

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Fund Wallet',
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
