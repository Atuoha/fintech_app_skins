import 'package:fintech_app_ui/constants/color.dart';
import 'package:fintech_app_ui/screens/main/history.dart';
import 'package:fintech_app_ui/screens/main/home.dart';
import 'package:fintech_app_ui/screens/main/subscriptions.dart';
import 'package:fintech_app_ui/screens/main/wallet.dart';
import 'package:flutter/material.dart';

import 'account.dart';

class BottomNav extends StatefulWidget {
  static const routeName = '/bottomNav';
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  var currentIndex = 0;
  final _screens = const [
    HomeScreen(),
    HistoryScreen(),
    SubscriptionScreen(),
    WalletScreen(),
    AccountScreen(),
  ];

  changeScreen(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: changeScreen,
        selectedItemColor: hoverColor,
        unselectedItemColor: greyShade2,
        showUnselectedLabels: true,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                border: currentIndex == 0
                    ?  Border(
                        top: BorderSide(
                          color: hoverColor,
                          width: 2,
                        ),
                      )
                    : null,
              ),
              child: const Icon(Icons.home_outlined),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                border: currentIndex == 1
                    ?  Border(
                  top: BorderSide(
                    color: hoverColor,
                    width: 2,
                  ),
                )
                    : null,
              ),
              child: const Icon(Icons.history),
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                border: currentIndex == 2
                    ?  Border(
                  top: BorderSide(
                    color: hoverColor,
                    width: 2,
                  ),
                )
                    : null,
              ),
              child: const Icon(Icons.event_note_outlined),
            ),
            label: 'Subscriptions',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                border: currentIndex == 3
                    ?  Border(
                  top: BorderSide(
                    color: hoverColor,
                    width: 2,
                  ),
                )
                    : null,
              ),
              child: const Icon(Icons.account_balance_wallet_rounded),
            ),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                border: currentIndex == 4
                    ?  Border(
                  top: BorderSide(
                    color: hoverColor,
                    width: 2,
                  ),
                )
                    : null,
              ),
              child: const Icon(Icons.account_circle_outlined),
            ),
            label: 'Account',
          ),
        ],
      ),
      body: _screens[currentIndex],
    );
  }
}
