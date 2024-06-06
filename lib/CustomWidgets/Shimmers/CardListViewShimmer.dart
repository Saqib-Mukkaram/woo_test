import 'package:flutter/material.dart';

import 'CardShimmer.dart';

class CardListViewShimmer extends StatelessWidget {
  const CardListViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (con, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: const SizedBox(
            height: 300,
            width: 275,
            child: CardShimmer(),
          ),
        ),
      ),
    );
  }
}
