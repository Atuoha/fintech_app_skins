import 'package:fintech_app_ui/components/balance_container.dart';
import 'package:fintech_app_ui/screens/other/withdraw.dart';
import 'package:fintech_app_ui/screens/tabs/wallet_screen_cards.dart';
import 'package:flutter/material.dart';
import '../../components/kContainer.dart';
import '../../constants/color.dart';
import '../other/add_new_card.dart';
import '../other/fund_card.dart';
import '../tabs/wallet_screen_transactions.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  var currentTabIndex = 0;
  final tabTitles = [
    'Transactions',
    'Cards',
  ];

  // final tabs = const [
  //   TransactionsTab(),
  //   CardsTab(),
  // ];

  Widget tabContainer(int index, String title) {
    return GestureDetector(
      onTap: () => setState(() {
        currentTabIndex = index;
      }),
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width / 2.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: currentTabIndex == index ? primaryColor : Colors.transparent,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: currentTabIndex == index ? Colors.white : greyShade1,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        left: 18,
        // right: 18,
        top: 80,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Wallet',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(right: 18.0),
              child: BalanceContainer(),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pushNamed(AddNewCard.routeName),
                    child: const KContainer(
                      iconBg: masterYellow,
                      color: makeNewPlanBg,
                      text: 'Add new card',
                      icon: Icons.credit_card,
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pushNamed(FundCard.routeName),
                    child: const KContainer(
                      iconBg: Colors.green,
                      color: fundWalletBg,
                      text: 'Fund Card',
                      icon: Icons.local_atm,
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pushNamed(Withdraw.routeName),
                    child: const KContainer(
                      iconBg: Colors.red,
                      color: manageSubColor,
                      text: 'Withdraw',
                      icon: Icons.wallet,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.8,
                    color: greyShade2,
                  ),
                  borderRadius: BorderRadius.circular(5),
                  // color: Colors.red,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tabTitles.length,
                  itemBuilder: (context, index) => tabContainer(
                    index,
                    tabTitles[index],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              child: currentTabIndex == 0
                  ? const TransactionsTab()
                  : const CardsTab(),
            ),
          ],
        ),
      ),
    );
  }
}
