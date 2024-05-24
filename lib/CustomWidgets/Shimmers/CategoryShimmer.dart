import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: Container(
        height: 100,
        width: 100,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, -1), // changes position of shadow
          ),
        ], color: Colors.grey, borderRadius: BorderRadius.circular(50)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      gradient: LinearGradient(colors: [
        Colors.white,
        // Color.fromARGB(255, 196, 143, 27),
        Colors.grey,
      ]),
      direction: ShimmerDirection.ltr,
      loop: 5,
      // period: Duration(milliseconds: 1500),
    );
  }
}
