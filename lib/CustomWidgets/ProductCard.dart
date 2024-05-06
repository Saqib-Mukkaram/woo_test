import 'package:flutter/material.dart';
import 'package:woo_test/Models/Images.dart';

class ProductCard extends StatelessWidget {
  final int id;
  final String name;
  final double price;
  final List<Images> image;

  ProductCard(
      {super.key,
      required this.id,
      required this.name,
      required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(maxHeight: 150, maxWidth: 100),
            child: Image.network(
              "${image[0].src}",
              fit: BoxFit.fitWidth,
            ),
          ),
          Text("$name"),
          Text("$price"),
        ],
      ),
    );
  }
}
