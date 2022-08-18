import 'package:flutter/material.dart';
import '../constants/color.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Image.asset(
                  'assets/images/search.png',
                  width: 5,
                ),
              ),
              hintText: 'Search',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 1,
                  color: greyShade2,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 63,
            width: 60,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                'assets/images/filter.png',
                color: Colors.white,
                width: 50,
              ),
            ),
          ),
        )
      ],
    );
  }
}
