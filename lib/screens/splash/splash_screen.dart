import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants/color.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

enum Operation { goFront, goBack }

class _SplashScreenState extends State<SplashScreen> {
  var splashIndex = 0;

  final splashContents = [
    {
      'image': 'assets/images/sp_image1',
      'title': 'Virtual Card',
      'content':
          'Get your virtual card in 5 minutes \n make international transactions.',
    },
    {
      'image': 'assets/images/sp_image2',
      'title': 'Fund Easily',
      'content': 'Fund your wallet from your bank \n account without hassle.',
    },
    {
      'image': 'assets/images/sp_image3',
      'title': 'Make Subscriptions',
      'content': 'Make subscriptions to any \n platform without limits',
    },
  ];

  splashAction(Operation operation) {
    switch (operation) {
      case Operation.goFront:
        setState(() {
          splashIndex += splashIndex;
        });
        break;

      case Operation.goBack:
        setState(() {
          splashIndex -= splashIndex;
        });
        break;
    }
  }

  Widget counterContainer(int index) {
    return InkWell(
      onTap: () => setState(() {
        splashIndex = index;
      }),
      child: Container(
        height: 20,
        decoration: BoxDecoration(
          color: splashIndex == index ? masterYellow : greyShade1,
        ),
      ),
    );
  }

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
        leading: splashIndex > 0
            ? InkWell(
                onTap: () => splashAction(Operation.goBack),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const [
                    Icon(Icons.chevron_left, color: greyShade2),
                    SizedBox(width: 5),
                    Text(
                      'Back',
                      style: TextStyle(
                        color: greyShade2,
                      ),
                    )
                  ],
                ),
              )
            : const Text(''),
        actions: [
          splashIndex < 3
              ? InkWell(
                  onTap: () => splashAction(Operation.goBack),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: const [
                      Text(
                        'Skip',
                        style: TextStyle(
                          color: greyShade2,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.chevron_right, color: greyShade2),
                      Icon(Icons.chevron_right, color: greyShade2),
                    ],
                  ),
                )
              : const Text(''),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(splashContents[splashIndex]['image']!),
          const SizedBox(height: 10),
          Text(
            splashContents[splashIndex]['title']!,
            style: const TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            splashContents[splashIndex]['content']!,
            style: const TextStyle(
              color: greyShade1,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 20,
            child: ListView.builder(
              itemCount: splashContents.length,
              itemBuilder: (context, index) => counterContainer(index),
            ),
          ),
          if (splashIndex < 3 && splashIndex > 0) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                  ),
                  onPressed: () => splashAction(Operation.goBack),
                  icon: const Icon(Icons.chevron_left),
                  label: const Text('Back'),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    padding: const EdgeInsets.all(20),
                  ),
                  onPressed: () => splashAction(Operation.goFront),
                  icon: const Icon(Icons.chevron_left),
                  label: const Text('Back'),
                )
              ],
            ),
          ] else ...[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: primaryColor,
              ),
              onPressed: null,
              child: const Text('Get Started'),
            ),
            ElevatedButton(
              // style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(border:)),
              onPressed: null, child: Text('Get Started'),
            ),
          ]
        ],
      ),
    );
  }
}
