import 'package:fintech_app_ui/components/exchange_container.dart';
import 'package:fintech_app_ui/constants/color.dart';
import 'package:fintech_app_ui/providers/payment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/kContainer.dart';
import '../../components/virtual_card_back.dart';
import '../../components/virtual_card_front.dart';
import '../../providers/virtual_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // this shows whether the card is showing the front or the back
  var cardFront = true;

  toggleCardFace() {
    setState(() {
      cardFront = !cardFront;
    });
  }

  @override
  Widget build(BuildContext context) {
    var activeCard = Provider.of<VirtualCardData>(context).getActiveCard();
    var payments = Provider.of<PaymentData>(context).getPayments();
    return Container(
      padding: const EdgeInsets.only(
        left: 18,
        right: 18,
        top: 80,
      ),
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.6, 0.8),
          end: FractionalOffset(0.9, 0.0),
          stops: [0.4, 0.4],
          tileMode: TileMode.clamp,
          colors: [
            Colors.white,
            primaryColor,
          ],
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome Back,',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Text(
              'Ujunwa Peace',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const ExchangeContainer(),
            InkWell(
              onTap: () => toggleCardFace(), // for switching card face
              child: Center(
                child: cardFront
                    ? VirtualCardUI(
                        cardColor: activeCard.cardColor,
                        cardName: activeCard.cardName,
                        cardNumber: activeCard.cardNumber,
                        expiry: activeCard.expiry,
                        isMaster: activeCard.isMaster,
                      )
                    : VirtualCardBack(cvc: activeCard.cvc),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  KContainer(
                    iconBg: masterYellow,
                    color: makeNewPlanBg,
                    text: 'Add new plan',
                    icon: Icons.create_new_folder_outlined,
                  ),
                  KContainer(
                    iconBg: Colors.blue,
                    color: makeSubBg,
                    text: 'Make Subscription',
                    icon: Icons.notifications_active_outlined,
                  ),
                  KContainer(
                    iconBg: Colors.green,
                    color: fundWalletBg,
                    text: 'Fund Wallet',
                    icon: Icons.money,
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Upcoming Payments',
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: payments.length,
                    itemBuilder: (context, index) {
                      var today = DateTime.now();
                      var date = payments[index].date;
                      var daysLeft = date.difference(today).inDays;
                      return Column(
                        children: [
                          ListTile(
                            leading: Image.asset(payments[index].imgAsset),
                            title: Text(
                              payments[index].title,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text('$daysLeft days left'),
                            trailing: Text(
                              'N${payments[index].amount}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const Divider(
                            thickness: 1.0,
                            color: greyShade2,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
