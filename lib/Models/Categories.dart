import 'package:woo_test/Models/Images.dart';

class Categories {
  final int id;
  final String name;
  final String slug;
  List<Images>? images;

  //constructor
  Categories(
      {required this.id, required this.name, required this.slug, this.images});

  //from json
  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
        id: json['id'],
        name: json['name'],
        slug: json['slug'],
        images: List<Images>.from(
            json['images'].map((image) => Images.fromJson(image))) ??[]);
  }
}
