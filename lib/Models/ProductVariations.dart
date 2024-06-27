import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'Attributes.dart';
import 'Images.dart';

class ProductVariations {
  final int id;
  final String? permalink;
  final String dateCreated;
  final String dateModified;
  final String price;
  final String regularPrice;
  final String salePrice;
  final bool onSale;
  final bool? purchaseable;
  final String status;
  final String stockStatus;
  final int? stockQuantity;
  final String sku;
  final Images image;
  Rx<bool> selected = false.obs;

  // final Attributes attributes;

  // Constructor
  ProductVariations({
    required this.id,
    this.permalink,
    required this.dateCreated,
    required this.dateModified,
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    required this.onSale,
    this.purchaseable,
    required this.status,
    required this.stockStatus,
    this.stockQuantity,
    required this.sku,
    required this.image,
  }) {
    selected = false.obs;
  }

  // fromJson factory method
  factory ProductVariations.fromJson(Map<String, dynamic> json) {
    return ProductVariations(
      id: json['id'],
      permalink: json['permalink'],
      dateCreated: json['date_created'],
      dateModified: json['date_modified'],
      price: json['price'],
      regularPrice: json['regular_price'],
      salePrice: json['sale_price'],
      onSale: json['on_sale'],
      purchaseable: json['purchasable'],
      status: json['status'],
      stockStatus: json['stock_status'],
      stockQuantity: json['stock_quantity'],
      sku: json['sku'],
      image: Images.fromJson(json['image']),
      // attributes: Attributes.fromJson(json['attributes']),
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'permalink': permalink,
      'date_created': dateCreated,
      'date_modified': dateModified,
      'price': price,
      'regular_price': regularPrice,
      'sale_price': salePrice,
      'on_sale': onSale,
      'purchasable': purchaseable,
      'status': status,
      'stock_status': stockStatus,
      'stock_quantity': stockQuantity,
      'sku': sku,
      'image': image.toJson(),
      // 'attributes': attributes.toJson(),
    };
  }
}
