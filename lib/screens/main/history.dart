import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/searchbox.dart';
import '../../constants/color.dart';
import '../../providers/history.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  @override
  Widget build(BuildContext context) {
    var historyData = Provider.of<HistoryData>(context);
    return Padding(
      padding: const EdgeInsets.only(
        left: 18,
        right: 18,
        top: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Text(
            'History',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 10),
          const SearchBox(),
          const SizedBox(height: 20),
          const Text(
            'Today',
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 150,
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: historyData.getTodayHistories().length,
                    itemBuilder: (context, index) {
                      var todayHistory = historyData.getTodayHistories()[index];
                      return Column(
                        children: [
                          ListTile(
                            leading: Image.asset(todayHistory.imgAsset),
                            title: Text(
                              todayHistory.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            trailing: Text(
                              'N${todayHistory.amount}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const Divider(thickness: 1.0, color: greyShade2),
                        ],
                      );
                    }),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Yesterday',
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 270,
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
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            trailing: Text(
                              'N${todayHistory.amount}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const Divider(thickness: 1.0, color: greyShade2),
                        ],
                      );
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
