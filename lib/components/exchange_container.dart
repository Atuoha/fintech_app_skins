import 'package:flutter/material.dart';
class ExchangeContainer extends StatelessWidget {
  const ExchangeContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nairaValue = 685.25;
    Size size = MediaQuery.of(context).size;
    return  Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.all(10),
      height: size.height * 0.1,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: [
          const Text('Currency Rate'),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Image.asset('assets/images/ng_flag.png',width: 30,),
                  const SizedBox(width: 5),
                  Text('NGN $nairaValue'),
                ],
              ),
              const Icon(Icons.compare_arrows),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Text('1.00 USD'),
                  const SizedBox(width: 5),
                  Image.asset('assets/images/usa_flag.png',width: 30,),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
