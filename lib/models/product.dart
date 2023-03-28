import 'package:betterask_exam/models/product_details.dart';

class Product {
  final String id;
  final String title;
  final double price;
  final int stock;
  final String thumbnail;
  final double discountPercentage;
  ProductDetails? details;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.stock,
    required this.thumbnail,
    required this.discountPercentage,
    this.details,
  });

  // Named constructor to create a Product instance from a JSON object
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      stock: json['stock'],
      thumbnail: json['thumbnail'],
      discountPercentage: json['discountPercentage'].toDouble(),
    );
  }
}