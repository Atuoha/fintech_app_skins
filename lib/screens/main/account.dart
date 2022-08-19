import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../constants/color.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  // custom widget for each profile details
  Widget kProfileRow(title, text) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            // const SizedBox(width: 50),
            // uncomment and remove the mainAxisAlignment spaceBetween to follow prototype design
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: greyShade1,
              ),
            ),
          ],
        ),
        Divider(
          thickness: 1,
          color: greyShade2.withOpacity(0.4),
        ),
      ],
    );
  }

  // Thank you for knowing and deciding for me that I didn't need.... It made me feel happy :)
  // I thought it was like a therapy but you have made me realize it is not the only way to relax
  // i just needed to feel relaxed and probably happy :)

  // widget for each text button
  Widget kButtonRow(
    IconData icon,
    String title,
    Function action,
    Color iconColor,
    Color textColor,
  ) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(
            icon,
            color: iconColor,
          ),
          title: Text(
            title,
            style: TextStyle(color: textColor),
          ),
          trailing: IconButton(
            onPressed: () => action(),
            icon: const Icon(
              Icons.chevron_right,
              color: Colors.black,
            ),
          ),
        ),
        Divider(
          thickness: 1,
          color: greyShade2.withOpacity(0.4),
        ),
      ],
    );
  }

  _accountSettings() {
    if (kDebugMode) {
      print('Account settings');
    }
  }

  _help() {
    if (kDebugMode) {
      print('help');
    }
  }

  _rateApp() {
    if (kDebugMode) {
      print('rate app');
    }
  }

  _logout() {
    if (kDebugMode) {
      print('logout');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        left: 18,
        right: 18,
        top: 80,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Account',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              height: size.height / 7,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: primaryColor,
              ),
              child: Row(
                children: [
                  Image.asset('assets/images/avatar.png'),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Ujunwa Peace',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '0241053429',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Personal Details',
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            kProfileRow('Email', 'ujunwapeace009@outlook.com'),
            kProfileRow('Phone', '+23490913550054'),
            kProfileRow('Address', 'Owerri, Nigeria'),
            const SizedBox(height: 20),
            kButtonRow(
              Icons.settings,
              'Account Setting',
              _accountSettings,
              primaryColor,
              Colors.black,
            ),
            kButtonRow(
              Icons.help_outline,
              'Help',
              _help,
              primaryColor,
              Colors.black,
            ),
            kButtonRow(
              Icons.star_border,
              'Rate App',
              _rateApp,
              masterYellow,
              Colors.black,
            ),
            kButtonRow(
              Icons.logout,
              'Log out',
              _logout,
              masterRed,
              masterRed,
            ),
          ],
        ),
      ),
    );
  }
}
