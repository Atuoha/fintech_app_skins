import 'package:flutter/material.dart';
import '../constants/color.dart';

class BalanceContainer extends StatefulWidget {
  const BalanceContainer({Key? key}) : super(key: key);

  @override
  State<BalanceContainer> createState() => _BalanceContainerState();
}

class _BalanceContainerState extends State<BalanceContainer> {
  final _currencies = [
    'Change currency',
    'NGN',
    'CAD',
    'USD',
    'EURO',
  ];

  // ignore: prefer_typing_uninitialized_variables
  var _currentCurrency;

  @override
  void initState() {
    // TODO: implement initState
    _currentCurrency = _currencies[0];
    super.initState();
  }

  _changeCurrency(String value) {
    setState(() {
      _currentCurrency = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 15,
      ),
      height: size.height / 6,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: primaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Balance',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: size.width / 2.1,
                height: size.height * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: changeCurrencyBg,
                ),
                child: DropdownButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: primaryColor,
                  ),
                  underline: const Text(''),
                  value: _currentCurrency,
                  items: _currencies
                      .map(
                        (data) => DropdownMenuItem(
                      value: data,
                      child: Text(
                        data,
                        style: const TextStyle(
                          color: primaryColor,
                        ),
                      ),
                    ),
                  )
                      .toList(),
                  onChanged: (value) => _changeCurrency(
                    value.toString(),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'N502,3555,000',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
