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
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            Text(message),
            successStatus ?Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Amount:',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'N$amount',
                      style: const TextStyle(
                        color: greyShade2,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      'Transaction ID:',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      transId,
                      style: const TextStyle(
                        color: greyShade2,
                      ),
                    )
                  ],
                )
              ],
            ): const Text(''),

          ],
        ),
      ),
    );
  }
}
