import 'package:flutter/material.dart';

class VirtualCard with ChangeNotifier{
  final String id;
  final String cardColor;
  final String cardName;
  final bool isMaster;
  final String expiry;
  final String cardNumber;
  final String pin;
  final int cvc;
  double balanceAmount;
  bool isActive;
  bool amountVisibility;

  VirtualCard({
    required this.id,
    required this.cardColor,
    required this.cardName,
    this.isMaster = true,
    required this.pin,
    required this.expiry,
    required this.cardNumber,
    this.balanceAmount = 0.0,
    required this.cvc,
    this.isActive = false,
    this.amountVisibility = true,
  });

  toggleIsActive(){
    isActive = !isActive;
  }

  toggleCardAmountVisibility(){
    amountVisibility = !amountVisibility;
  }

  switchOffIsActive(){
    isActive = false;
  }

  creditCard(double amount){
    balanceAmount += amount;
  }

  debitCard(double amount){
    balanceAmount -= amount;
  }
}
