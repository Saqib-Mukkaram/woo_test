import 'Categories.dart';
import 'Images.dart';
import 'Tags.dart';

enum ProductType{Simple, Variable}
enum ProductStatus {Published, Draft}
class Products {
  final int id;
  final String name;
  final String slug;
  final String permalink;
  final String dateCreated;
  final String dateModified;
  final ProductType type;
  final ProductStatus status;
  final bool featured;
  final String catalogVisibility;
  final String description;
  final String shortDescription;
  final double price;
  final double regularPrice;
  final double salePrice;
  final bool onSale;
  final bool purchaseable;
  final int totalSales;
  final ProductCategories category;
  final List<Tags> tags;
  final List<Images> images;

  //constructor
  Products({
    required this.id,
    required this.name,
    required this.slug,
    required this.permalink,
    required this.dateCreated,
    required this.dateModified,
    required this.type,
    required this.status,
    required this.featured,
    required this.catalogVisibility,
    required this.description,
    required this.shortDescription,
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    required this.onSale,
    required this.purchaseable,
    required this.totalSales,
    required this.category,
    required this.tags,
    required this.images
  });

  //from json
  factory Products.fromJson(Map<String, dynamic> json){

    return Products(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      permalink: json['permalink'],
      dateCreated: json['date_created']?? "",
      dateModified: json['date_modified'],
      type: json['type'] == 'simple' ? ProductType.Simple : ProductType.Variable,
      status: json['status'] == 'publish' ? ProductStatus.Published : ProductStatus.Draft,
      featured: json['featured'],
      catalogVisibility: json['catalog_visibility'],
      description: json['description'],
      shortDescription: json['short_description'],
      price: int.parse(json['price']).toDouble() ?? 0,
      regularPrice: json['regular_price']  == '' ? 0.0 : double.parse(json['regular_price']) ?? 0.0,
      salePrice: json['sale_price'] == '' ? 0.0 : double.parse(json['sale_price']) ?? 0.0,
      onSale: json['on_sale'],
      purchaseable: json['purchaseable'] ?? false,
      totalSales: json['total_sales'],
      category: ProductCategories.fromJson(json['categories'][0]),
      tags: List<Tags>.from(json['tags'].map((tag) => Tags.fromJson(tag))),
      images: List<Images>.from(json['images'].map((image) => Images.fromJson(image)))
    );
  }

}


