import 'package:flutter/material.dart';

import '../../constants/color.dart';

class CardsTab extends StatelessWidget {
  const CardsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
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
              )),
        ),
      ],
    );
  }
}
