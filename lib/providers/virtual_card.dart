import 'package:flutter/material.dart';
import '../model/virtual_card.dart';

class VirtualCardData extends ChangeNotifier {

  //balance
  double balance  = 900000;

  // dummy user password  TODO: This will later implemented using auth provider
  var password = 'anthony123';

  getUserPassword(){
    return password;
  }

  getBalance(){
    return balance;
  }



  withdrawFromBalance(double amount){
    balance -= amount;
    notifyListeners();
  }



  fundAccount(double amount){
    balance += amount;
    notifyListeners();
  }

  toggleActivation(String id) {
    for (var card in _cards) {
      card.switchOffIsActive();
    }
    var kCard = _cards.firstWhere(
      (card) => card.id == id,
    );
    kCard.toggleIsActive();
    notifyListeners();
  }

  VirtualCard findById(String id) {
    return _cards.firstWhere(
      (card) => card.id == id,
    );
  }


  addCard(VirtualCard vCard) {
    var card = VirtualCard(
      id: DateTime.now().toString(),
      cardColor: vCard.cardColor,
      cardName: vCard.cardName,
      pin: vCard.pin,
      expiry: vCard.expiry,
      cardNumber: vCard.cardNumber,
      cvc: vCard.cvc,
    );

    _cards.add(card);
    notifyListeners();
  }

  deleteCard(String id) {
    _cards.removeWhere(
      (card) => card.id == id,
    );
    notifyListeners();
  }

  VirtualCard getActiveCard() {
    return _cards.firstWhere(
      (card) => card.isActive == true,
    );
  }

  fundActiveCard(double amount){
    var card = _cards.firstWhere(
          (card) => card.isActive == true,
    );
    card.creditCard(amount);
    notifyListeners();
  }

  debitActiveCard(double amount){
    var card = _cards.firstWhere(
          (card) => card.isActive == true,
    );
    card.debitCard(amount);
    notifyListeners();
  }

  toggleCardAmountVisibility(String id){
   var card =  _cards.firstWhere(
          (card) => card.id == id,
    );
   card.toggleCardAmountVisibility();
   notifyListeners();
  }

  getCardAmountVisibility(String id){
    var card =  _cards.firstWhere(
          (card) => card.id == id,
    );
    return card.amountVisibility;
  }

  getActiveCardPin(){
    var card = _cards.firstWhere(
          (card) => card.isActive == true,
    );
    return card.pin;
  }

  getActiveCardBalance(){
    var card = _cards.firstWhere(
          (card) => card.isActive == true,
    );
    return card.balanceAmount;
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
      id: '1',
      cardColor: 'red',
      cardName: 'Ujunwa Peace',
      cardNumber: '1834 8905 5435 8654',
      pin: '8478',
      expiry: '09/25',
      cvc: 345,
      isActive: true,
    ),
    VirtualCard(
      id: '2',
      cardColor: 'green',
      cardName: 'Ujunwa Peace',
      cardNumber: '7898 4332 9834 3454',
      expiry: '08/24',
      pin: '4577',
      cvc: 765,
      isMaster: false,
    ),
    VirtualCard(
      id: '3',
      cardColor: 'blue',
      cardName: 'Ujunwa Peace',
      cardNumber: '3608 2562 1574 4721',
      pin:'6788',
      expiry: '08/25',
      cvc: 155,
    )
  ];
}
