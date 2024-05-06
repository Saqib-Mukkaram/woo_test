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
    return LayoutBuilder(
      builder: (con, sizeLimit) {
        return Container(
          constraints: BoxConstraints(maxWidth: sizeLimit.maxHeight),
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
                // constraints: BoxConstraints(maxWidth: 100),
                child: Image.network(
                  "${image[0].src}",
                  fit: BoxFit.fitWidth,
                  width: sizeLimit.maxWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("$name",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                        // color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w400)),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("\$$price",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
