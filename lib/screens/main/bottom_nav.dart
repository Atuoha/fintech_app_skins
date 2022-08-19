import 'package:fintech_app_ui/constants/color.dart';
import 'history.dart';
import 'home.dart';
import 'subscriptions.dart';
import 'wallet.dart';
import 'package:flutter/material.dart';
import 'account.dart';
import 'package:flutter/services.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomNav extends StatefulWidget {
  static const routeName = '/bottomNav';

  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
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
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: currentIndex,
        height: 60.0,
        items: [
          Icon(
            Icons.home_outlined,
            size: 30,
            color: currentIndex == 0 ? primaryColor : greyShade2,
          ),
          Icon(
            Icons.history,
            size: 30,
            color: currentIndex == 1 ? primaryColor : greyShade2,
          ),
          Icon(
            Icons.event_note_outlined,
            size: 30,
            color: currentIndex == 2 ? primaryColor : greyShade2,
          ),
          Icon(
            Icons.account_balance_wallet_outlined,
            size: 30,
            color: currentIndex == 3 ? primaryColor : greyShade2,
          ),
          Icon(
            Icons.account_circle_outlined,
            size: 30,
            color: currentIndex == 4 ? primaryColor : greyShade2,
          ),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: primaryColor,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: const Duration(milliseconds: 600),
        onTap: changeScreen,
        letIndexChange: (index) => true,
      ),
      body: _screens[currentIndex],
    );

    //UNCOMMENT AND COMMENT UP -- TRADITIONAL BOTTOM NAV AND THIS CONCEPT
    // FOLLOWS EXACTLY THE DESIGN OF THE PROTOTYPE AM USING BUT I LOOK COOL THINGS AND I CAN'T HELP :)

    // return Scaffold(
    //   bottomNavigationBar: BottomNavigationBar(
    //     currentIndex: currentIndex,
    //     onTap: changeScreen,
    //     selectedItemColor: hoverColor,
    //     unselectedItemColor: greyShade2,
    //     showUnselectedLabels: true,
    //     elevation: 0,
    //     items: [
    //       BottomNavigationBarItem(
    //         icon: Container(
    //           padding: const EdgeInsets.only(top: 10),
    //           decoration: BoxDecoration(
    //             border: currentIndex == 0
    //                 ?  Border(
    //                     top: BorderSide(
    //                       color: hoverColor,
    //                       width: 2,
    //                     ),
    //                   )
    //                 : null,
    //           ),
    //           child: const Icon(Icons.home_outlined),
    //         ),
    //         label: 'Home',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Container(
    //           padding: const EdgeInsets.only(top: 10),
    //           decoration: BoxDecoration(
    //             border: currentIndex == 1
    //                 ?  Border(
    //               top: BorderSide(
    //                 color: hoverColor,
    //                 width: 2,
    //               ),
    //             )
    //                 : null,
    //           ),
    //           child: const Icon(Icons.history),
    //         ),
    //         label: 'History',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Container(
    //           padding: const EdgeInsets.only(top: 10),
    //           decoration: BoxDecoration(
    //             border: currentIndex == 2
    //                 ?  Border(
    //               top: BorderSide(
    //                 color: hoverColor,
    //                 width: 2,
    //               ),
    //             )
    //                 : null,
    //           ),
    //           child: const Icon(Icons.event_note_outlined),
    //         ),
    //         label: 'Subscriptions',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Container(
    //           padding: const EdgeInsets.only(top: 10),
    //           decoration: BoxDecoration(
    //             border: currentIndex == 3
    //                 ?  Border(
    //               top: BorderSide(
    //                 color: hoverColor,
    //                 width: 2,
    //               ),
    //             )
    //                 : null,
    //           ),
    //           child: const Icon(Icons.account_balance_wallet_rounded),
    //         ),
    //         label: 'Wallet',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Container(
    //           padding: const EdgeInsets.only(top: 10),
    //           decoration: BoxDecoration(
    //             border: currentIndex == 4
    //                 ?  Border(
    //               top: BorderSide(
    //                 color: hoverColor,
    //                 width: 2,
    //               ),
    //             )
    //                 : null,
    //           ),
    //           child: const Icon(Icons.account_circle_outlined),
    //         ),
    //         label: 'Account',
    //       ),
    //     ],
    //   ),
    //   body: _screens[currentIndex],
    // );
  }
}
