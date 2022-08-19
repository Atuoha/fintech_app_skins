import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/color.dart';
import '../../providers/history.dart';

class TransactionsTab extends StatelessWidget {
  const TransactionsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var historyData = Provider.of<HistoryData>(context);
    return SizedBox(
      height: size.height / 2.7,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: historyData.getHistories().length,
            itemBuilder: (context, index) {
              var todayHistory = historyData.getHistories()[index];
              return Column(
                children: [
                  ListTile(
                    leading: Image.asset(todayHistory.imgAsset),
                    title: Text(
                      todayHistory.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Text(
                      'N${todayHistory.amount}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Divider(thickness: 1.0, color: greyShade2),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
