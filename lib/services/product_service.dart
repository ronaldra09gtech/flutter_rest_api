import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:betterask_exam/models/product.dart';
import 'package:betterask_exam/models/product_details.dart';

class ProductService {
  final String _baseUrl = 'https://dummyjson.com';

  // Fetch the list of products
  Future<List<Product>> fetchProducts({required int limit, required int skip}) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/products?limit=$limit&skip=$skip&select=title,price,thumbnail,stock,discountPercentage'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to fetch products');
    }
  }

  // Fetch the details of a specific product
  Future<ProductDetails> fetchProductDetails(String productId) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/products/$productId'),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return ProductDetails.fromJson(data);
    } else {
      throw Exception('Failed to fetch product details');
    }
  }
}