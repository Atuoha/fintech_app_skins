import 'package:fintech_app_ui/model/history.dart';
import 'package:flutter/material.dart';

class HistoryData extends ChangeNotifier {
  History findById(int id) {
    return _histories.firstWhere((payment) => payment.id == id);
  }

  getPayments() {
    return [..._histories];
  }

  final _todayHistories = [];

  getTodayHistories() {
    var todayDate = DateTime.now();
    for (var history in _histories) {
      if (history.date == todayDate) {
        _todayHistories.add(history);
      }
    }
  }

  final _histories = [
    History(
      id: 1,
      title: 'Netflix',
      imgAsset: 'assets/images/netflix.png',
      amount: 3200,
      date: DateTime(2022, 9, 22),
    ),
    History(
      id: 3,
      title: 'Canva',
      imgAsset: 'assets/images/canva.jpg',
      amount: 4200,
      date: DateTime(2022, 9, 19),
    ),
    History(
      id: 2,
      title: 'Spotify',
      imgAsset: 'assets/images/spotify.png',
      amount: 1200,
      date: DateTime(2022, 9, 20),
    ),
    History(
      id: 4,
      title: 'AudioMack',
      imgAsset: 'assets/images/audiomack.png',
      amount: 5200,
      date: DateTime(2022, 9, 21),
    ),
    History(
      id: 5,
      title: 'Adobe',
      imgAsset: 'assets/images/adobe.png',
      amount: 6200,
      date: DateTime(2022, 9, 21),
    ),
    History(
      id: 6,
      title: 'Flo',
      imgAsset: 'assets/images/flo.png',
      amount: 5200,
      date: DateTime(2022, 9, 21),
    ),
    History(
      id: 7,
      title: 'Karta',
      imgAsset: 'assets/images/karta.png',
      amount: 2100,
      date: DateTime(2022, 9, 21),
    ),
    History(
      id: 8,
      title: 'LinkedIn',
      imgAsset: 'assets/images/linkedin.png',
      amount: 1200,
      date: DateTime(2022, 9, 21),
    ),
    History(
      id: 9,
      title: 'Apple',
      imgAsset: 'assets/images/apple.png',
      amount: 9200,
      date: DateTime(2022, 9, 21),
    ),
  ];
}
