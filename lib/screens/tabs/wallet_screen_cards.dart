import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/virtual_card_back.dart';
import '../../components/virtual_card_front.dart';
import '../../constants/color.dart';
import '../../providers/virtual_card.dart';

class CardsTab extends StatefulWidget {
  const CardsTab({Key? key}) : super(key: key);

  @override
  State<CardsTab> createState() => _CardsTabState();
}

class _CardsTabState extends State<CardsTab> {
  // this shows whether the card is showing the front or the back
  var cardFront = true;

  toggleCardFace() {
    setState(() {
      cardFront = !cardFront;
    });
  }

  @override
  Widget build(BuildContext context) {
    var cards = Provider.of<VirtualCardData>(context).getCards();
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding:const EdgeInsets.only(right:18),
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
        SizedBox(
          height: size.height / 3.3,
          child: ListView.builder(
            padding: const EdgeInsets.only(right:10),
            scrollDirection: Axis.horizontal,
            itemCount: cards.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () => toggleCardFace(), // for switching card face
              child: Center(
                child: cardFront
                    ? VirtualCardUI(
                        cardColor: cards[index].cardColor,
                        cardName: cards[index].cardName,
                        cardNumber: cards[index].cardNumber,
                        expiry: cards[index].expiry,
                        isMaster: cards[index].isMaster,
                      )
                    : VirtualCardBack(cvc: cards[index].cvc),
              ),
            ),
          ),
        )
      ],
    );
  }
}
