import 'package:flutter/material.dart';
import '../model/virtual_card.dart';

class VirtualCardData extends ChangeNotifier {
  toggleIsActive(int id) {
    for (var card in _cards) {
      card.switchOffIsActive();
    }
    var kCard = _cards.firstWhere(
      (card) => card.id == id,
    );
    kCard.toggleIsActive();
    notifyListeners();
  }

  VirtualCard findById(int id) {
    return _cards.firstWhere(
      (card) => card.id == id,
    );
  }

  addCard(VirtualCard vCard) {
    var card = VirtualCard(
      id: int.parse(DateTime.now().toString()),
      cardColor: vCard.cardColor,
      cardName: vCard.cardName,
      expiry: vCard.expiry,
      cardNumber: vCard.cardNumber,
      cvc: vCard.cvc,
    );

    _cards.add(card);
    notifyListeners();
  }

  VirtualCard getActiveCard() {
    return _cards.firstWhere(
      (card) => card.isActive == true,
    );
  }

  List<VirtualCard> getInActiveCards() {
    return _cards
        .where(
          (card) => card.isActive == false,
        )
        .toList();
  }

  getCards() {
    return [..._cards];
  }

  final _cards = [
    VirtualCard(
      id: 1,
      cardColor: 'red',
      cardName: 'Ujunwa Peace',
      cardNumber: '1834 8905 5435 865',
      expiry: '09/25',
      cvc: 345,
      isActive: true,
    ),
    VirtualCard(
      id: 2,
      cardColor: 'green',
      cardName: 'Ujunwa Peace',
      cardNumber: '7898 4332 9834 345',
      expiry: '08/24',
      cvc: 765,
      isMaster: false,
    ),
    VirtualCard(
      id: 3,
      cardColor: 'black',
      cardName: 'Ujunwa Peace',
      cardNumber: '3608 2562 1574 472',
      expiry: '08/25',
      cvc: 765,
    )
  ];
}
