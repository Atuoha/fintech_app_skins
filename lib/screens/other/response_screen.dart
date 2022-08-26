import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants/color.dart';
import '../main/bottom_nav.dart';

class ResponseScreen extends StatelessWidget {
  const ResponseScreen({
    Key? key,
    required this.successStatus,
    required this.message,
    required this.amount,
    required this.transId,
  }) : super(key: key);
  final bool successStatus;
  final String message;
  final double amount;
  final String transId;


  _printReceipt(){
    //TODO: Implement Print Receipt
    if (kDebugMode) {
      print('Print Receipt');
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    Widget kRowContent(String title, String value) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: greyShade2,
              fontSize: 18,
            ),
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () => Navigator.of(
              context,
            ).pushNamed(BottomNav.routeName),
            child: const Icon(
              Icons.chevron_left,
              color: primaryColor,
            ),
          ),
        ),
        actions:  [
          Padding(
            padding: const EdgeInsets.only(right:10.0),
            child: IconButton(
              onPressed: ()=>_printReceipt,
              icon: const Icon(
                Icons.print,
                color: primaryColor,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            successStatus
                ? Image.asset('assets/images/success.gif')
                : Image.asset('assets/images/error.gif'),
            Text(
              successStatus ? 'Successful' : 'Error Occurred',
              style: TextStyle(
                color: successStatus ? successColor : errorColor,
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 20),
            Text(message,textAlign: TextAlign.center,),
            const SizedBox(height: 20),
            successStatus
                ? Column(
                    children: [
                      kRowContent('Amount:', 'N$amount'),
                      const SizedBox(height: 10),
                      kRowContent('Transaction ID:', transId),
                    ],
                  )
                : const Text(''),
          ],
        ),
      ),
    );
  }
}
