import 'package:woo_test/Models/Images.dart';

class ProductCategories {
  final int id;
  final String name;
  final String slug;

  //constructor
  ProductCategories({
    required this.id,
    required this.name,
    required this.slug,
  });

  //from json
  factory ProductCategories.fromJson(Map<String, dynamic> json) {
    return ProductCategories(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
    );
  }
}

class Categories {
  final int id;
  final String name;
  final String slug;
  final List<Images> image;

  //constructor
  Categories(
      {required this.id,
      required this.name,
      required this.slug,
      required this.image});

  //from json
  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      image: [
        Images.fromJson(json['image']) ??
            Images(id: 0, src: 'https://via.placeholder.com/150')
      ],
    );
  }
}
