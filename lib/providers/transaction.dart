import 'package:flutter/material.dart';

import '../model/transaction.dart';

class TransactionData extends ChangeNotifier {
  Transaction findById(int id) {
    return _transactions.firstWhere(
      (payment) => payment.id == id,
    );
  }

  getTransactions() {
    return [..._transactions];
  }

  final _transactions = [
    Transaction(
      id: 1,
      title: 'Netflix',
      imgAsset: 'assets/images/netflix.png',
      amount: 3200,
      date: DateTime(2022, 9, 22),
    ),
    Transaction(
      id: 3,
      title: 'Canva',
      imgAsset: 'assets/images/canva.jpg',
      amount: 4200,
      date: DateTime(2022, 9, 19),
    ),
    Transaction(
      id: 2,
      title: 'Spotify',
      imgAsset: 'assets/images/spotify.png',
      amount: 1200,
      date: DateTime(2022, 9, 20),
    ),
    Transaction(
      id: 4,
      title: 'AudioMack',
      imgAsset: 'assets/images/audiomack.png',
      amount: 5200,
      date: DateTime(2022, 9, 21),
    ),
    Transaction(
      id: 5,
      title: 'Adobe',
      imgAsset: 'assets/images/adobe.png',
      amount: 6200,
      date: DateTime(2022, 9, 21),
    ),
    Transaction(
      id: 6,
      title: 'Flo',
      imgAsset: 'assets/images/flo.png',
      amount: 5200,
      date: DateTime(2022, 9, 21),
    ),
    Transaction(
      id: 7,
      title: 'Karta',
      imgAsset: 'assets/images/karta.png',
      amount: 2100,
      date: DateTime(2022, 9, 21),
    ),
    Transaction(
      id: 8,
      title: 'LinkedIn',
      imgAsset: 'assets/images/linkedin.png',
      amount: 1200,
      date: DateTime(2022, 9, 21),
    ),
    Transaction(
      id: 9,
      title: 'Apple',
      imgAsset: 'assets/images/apple.png',
      amount: 9200,
      date: DateTime(2022, 9, 21),
    ),
  ];
}
