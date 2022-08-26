import 'package:fintech_app_ui/components/bottom_sheet_card.dart';
import 'package:fintech_app_ui/screens/other/add_new_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/virtual_card_front.dart';
import '../../constants/color.dart';
import '../../providers/virtual_card.dart';

class CardsTab extends StatefulWidget {
  const CardsTab({Key? key}) : super(key: key);

  @override
  State<CardsTab> createState() => _CardsTabState();
}

class _CardsTabState extends State<CardsTab> {
  @override
  Widget build(BuildContext context) {
    var cards = Provider.of<VirtualCardData>(context).getCards();
    Size size = MediaQuery.of(context).size;

    displayCard(String id, BuildContext context) {
      var card = Provider.of<VirtualCardData>(
        context,
        listen: false,
      ).findById(id);
      return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(200),
          ),
        ),
        context: context,
        builder: (context) => CardBottomSheet(card: card),
      );
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 18),
          child: InkWell(
            onTap: () {},
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 130,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 1,
                    color: primaryColor,
                    style: BorderStyle.solid,
                  ),
                  color: addNewCardBg,
                ),
                child: GestureDetector(
                  onTap: () => Navigator.of(
                    context,
                  ).pushNamed(AddNewCard.routeName),
                  child: const Text(
                    '+ Add New Card',
                    style: TextStyle(
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.height / 3.3,
          child: ListView.builder(
            padding: const EdgeInsets.only(right: 10),
            scrollDirection: Axis.horizontal,
            itemCount: cards.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () => displayCard(cards[index].id, context),
              child: Center(
                child: VirtualCardUI(
                  cardColor: cards[index].cardColor,
                  cardName: cards[index].cardName,
                  cardNumber: cards[index].cardNumber,
                  expiry: cards[index].expiry,
                  isMaster: cards[index].isMaster,
                    amount: cards[index].balanceAmount
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
