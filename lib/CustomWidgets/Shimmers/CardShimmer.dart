import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardShimmer extends StatelessWidget {
  const CardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: LayoutBuilder(
        builder: (con, sizeLimit) {
          return Container(
            constraints: BoxConstraints(maxWidth: sizeLimit.maxWidth,minHeight: sizeLimit.maxHeight),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 1))
                ]),
            child: Column(
              children: [
                Container(
                  width: sizeLimit.maxWidth,
                  height: sizeLimit.maxHeight,
                ),

              ],
            ),
          );
        },
      ),
      gradient: LinearGradient(colors: [
        Colors.white,
        // Color.fromARGB(255, 196, 143, 27),
        Colors.grey,
        Colors.white
      ]),
      direction: ShimmerDirection.rtl,
      loop: 5,

    );
  }
}
