import 'package:fintech_app_ui/screens/other/subscription_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/kContainer.dart';
import '../../components/searchbox.dart';
import '../../constants/color.dart';
import '../../providers/subscription.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var subscriptionData = Provider.of<SubscriptionData>(context);
    return Padding(
      padding: const EdgeInsets.only(
        left: 18,
        right: 18,
        top: 80,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Subscriptions',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 10),
            const SearchBox(),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                KContainer(
                  iconBg: masterYellow,
                  color: makeNewPlanBg,
                  text: 'Add new plan',
                  icon: Icons.create_new_folder_outlined,
                ),
                KContainer(
                  iconBg: Colors.blue,
                  color: makeSubBg,
                  text: 'Make \n Subscription',
                  icon: Icons.notifications_active_outlined,
                ),
                KContainer(
                  iconBg: Colors.red,
                  color: manageSubColor,
                  text: 'Manage \n Subscriptions',
                  icon: Icons.receipt_long,
                )
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'All plans',
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: null,
                  child: Text(
                    'view all',
                    style: TextStyle(
                      color: primaryColor,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: size.height / 2,
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: subscriptionData.getSubscriptions().length,
                    itemBuilder: (context, index) {
                      var sub =
                          subscriptionData.getSubscriptions()[index];
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(
                              context,
                            ).pushNamed(
                              SubscriptionDetails.routeName,
                              arguments: {'id': sub.id},
                            ),
                            child: ListTile(
                              leading: Image.asset(sub.imgAsset),
                              title: Text(
                                sub.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              trailing: Text(
                                'N${sub.amount}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const Divider(
                            thickness: 1.0,
                            color: greyShade2,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
