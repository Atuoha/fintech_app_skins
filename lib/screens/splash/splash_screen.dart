import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants/color.dart';
import '../auth/signup.dart';

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
      'image': 'assets/images/sp_img1.png',
      'title': 'Virtual Card',
      'content':
          'Get your virtual card in 5 minutes \n make international transactions.',
    },
    {
      'image': 'assets/images/sp_img2.png',
      'title': 'Fund Easily',
      'content': 'Fund your wallet from your bank \n account without hassle.',
    },
    {
      'image': 'assets/images/sp_img3.png',
      'title': 'Make Subscriptions',
      'content': 'Make subscriptions to any \n platform without limits',
    },
  ];

  splashAction(Operation operation) {
    switch (operation) {
      case Operation.goFront:
        setState(() {
          splashIndex += 1;
        });
        break;

      case Operation.goBack:
        setState(() {
          splashIndex -= 1;
        });
        break;
    }
  }

  Widget kElevatedButton() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
        ),
        onPressed: () => splashAction(Operation.goFront),
        icon: const Icon(Icons.chevron_left),
        label: const Text('Next'),
      ),
    );
  }

  Widget kTextButton() {
    return TextButton.icon(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(20),
      ),
      onPressed: () => splashAction(Operation.goBack),
      icon: const Icon(
        Icons.chevron_left,
        color: greyShade1,
      ),
      label: const Text(
        'Back',
        style: TextStyle(
          color: greyShade1,
        ),
      ),
    );
  }

  Widget counterContainer(int index) {
    return GestureDetector(
      onTap: () => setState(() {
        splashIndex = index;
      }),
      child: Container(
        margin: const EdgeInsets.all(2),
        height: 12,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: splashIndex == index ? masterYellow : greyShade2,
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
        leadingWidth: 100,
        leading: splashIndex > 0
            ? Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: GestureDetector(
                    onTap: () => splashAction(Operation.goBack),
                    child: const Text(
                      '< Back',
                      style: TextStyle(
                        color: greyShade1,
                      ),
                    )),
              )
            : const Text(''),
        actions: [
          splashIndex < 2
              ? Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: GestureDetector(
                    onTap: () => setState(() {
                      splashIndex = splashContents.length - 1;
                    }),
                    child: const Text(
                      'Skip >>',
                      style: TextStyle(
                        color: greyShade1,
                      ),
                    ),
                  ),
                )
              : const Text(''),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
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
              height: 12,
              width: 100,
              child: Center(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: splashContents.length,
                  itemBuilder: (context, index) => counterContainer(index),
                ),
              ),
            ),
            if (splashIndex < 2 && splashIndex > 0) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  kTextButton(),
                  kElevatedButton(),
                ],
              ),
            ] else if (splashIndex == 0) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [kElevatedButton()],
              )
            ] else ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: primaryColor,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 15,
                        ),
                      ),
                      onPressed: () => Navigator.of(
                        context,
                      ).pushNamed(
                        Signup.routeName,
                      ),
                      child: const Text('Get Started'),
                    ),
                  ],
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
