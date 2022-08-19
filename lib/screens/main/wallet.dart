import 'package:fintech_app_ui/screens/tabs/wallet_screen_cards.dart';
import 'package:flutter/material.dart';
import '../../components/kContainer.dart';
import '../../constants/color.dart';
import '../tabs/wallet_screen_transactions.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final _currencies = [
    'Change currency',
    'NGN',
    'CAD',
    'USD',
    'EURO',
  ];

  // ignore: prefer_typing_uninitialized_variables
  var _currentCurrency;

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
  void initState() {
    // TODO: implement initState
    _currentCurrency = _currencies[0];
    super.initState();
  }

  _changeCurrency(String value) {
    setState(() {
      _currentCurrency = value;
    });
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
      child:SingleChildScrollView(
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
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 15,
              ),
              height: size.height / 6,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: primaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Balance',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        width: size.width / 2.1,
                        height: size.height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: changeCurrencyBg,
                        ),
                        child: DropdownButton(
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: primaryColor,
                          ),
                          underline: const Text(''),
                          value: _currentCurrency,
                          items: _currencies
                              .map(
                                (data) => DropdownMenuItem(
                                  value: data,
                                  child: Text(
                                    data,
                                    style: const TextStyle(
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) => _changeCurrency(
                            value.toString(),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'N502,3555,000',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                KContainer(
                  iconBg: masterYellow,
                  color: makeNewPlanBg,
                  text: 'Add new card',
                  icon: Icons.credit_card,
                ),
                KContainer(
                  iconBg: Colors.green,
                  color: fundWalletBg,
                  text: 'Fund Wallet',
                  icon: Icons.local_atm,
                ),
                KContainer(
                  iconBg: Colors.red,
                  color: manageSubColor,
                  text: 'Withdraw',
                  icon: Icons.wallet,
                )
              ],
            ),
            const SizedBox(height: 20),
            Container(
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
