class ProductDetails {
  final String id;
  final String title;
  final double price;
  final String description;
  final List<String> images;
  final int stock;
  final double discountPercentage;

  ProductDetails({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.stock,
    required this.discountPercentage,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    return ProductDetails(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      images: List<String>.from(json['images'].map((image) => image as String)),
      stock: json['stock'],
      discountPercentage: json['discountPercentage'].toDouble(),
    );
  }
}