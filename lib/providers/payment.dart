import 'package:fintech_app_ui/model/payment.dart';
import 'package:flutter/material.dart';

class PaymentData extends ChangeNotifier {
  Payment findById(int id) {
    return _payments.firstWhere(
      (payment) => payment.id == id,
    );
  }

  getPayments() {
    return [..._payments];
  }

  final _payments = [
    Payment(
      id: 1,
      title: 'Netflix',
      imgAsset: 'assets/images/netflix.png',
      amount: 3200,
      date: DateTime(2022, 9, 22),
    ),
    Payment(
      id: 3,
      title: 'Canva',
      imgAsset: 'assets/images/canva.png',
      amount: 4200,
      date: DateTime(2022, 9, 19),
    ),
    Payment(
      id: 2,
      title: 'Spotify',
      imgAsset: 'assets/images/spotify.png',
      amount: 1200,
      date: DateTime(2022, 9, 20),
    ),
    Payment(
      id: 4,
      title: 'AudioMack',
      imgAsset: 'assets/images/audiomack.png',
      amount: 5200,
      date: DateTime(2022, 9, 21),
    ),
    Payment(
      id: 5,
      title: 'Adobe',
      imgAsset: 'assets/images/adobe.png',
      amount: 6200,
      date: DateTime(2022, 9, 21),
    ),
    Payment(
      id: 6,
      title: 'Flo',
      imgAsset: 'assets/images/flo.png',
      amount: 5200,
      date: DateTime(2022, 9, 21),
    ),
    Payment(
      id: 7,
      title: 'Karta',
      imgAsset: 'assets/images/karta.png',
      amount: 2100,
      date: DateTime(2022, 9, 21),
    ),
    Payment(
      id: 8,
      title: 'LinkedIn',
      imgAsset: 'assets/images/linkedin.png',
      amount: 1200,
      date: DateTime(2022, 9, 21),
    ),
    Payment(
      id: 9,
      title: 'Apple',
      imgAsset: 'assets/images/apple.png',
      amount: 9200,
      date: DateTime(2022, 9, 21),
    ),
  ];
}
