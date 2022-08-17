import 'package:fintech_app_ui/components/exchange_container.dart';
import 'package:fintech_app_ui/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  Widget kContainer(
    Color iconBg,
    Color color,
    String text,
    IconData icon,
  ) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 70,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Icon(
              icon,
              color: iconBg,
              size: 35,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(text)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var activeCard = Provider.of<VirtualCardData>(context).getActiveCard();
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 80,
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
            onTap: () => toggleCardFace(),
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
              children: [
                kContainer(
                  masterYellow,
                  makeNewPlanBg,
                  'Add new plan',
                  Icons.create_new_folder_outlined,
                ),
                kContainer(
                  Colors.blue,
                  makeSubBg,
                  'Make Subscription',
                  Icons.notifications_active_outlined,
                ),
                kContainer(
                  Colors.green,
                  fundWalletBg,
                  'Fund Wallet',
                  Icons.money,
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Upcoming Payments',
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
