import 'package:flutter_rest_api/models/product.dart';
import 'package:flutter_rest_api/models/product_details.dart';

abstract class ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;
  final bool hasReachedMax;

  ProductLoaded({required this.products, required this.hasReachedMax});
}

class ProductDetailsLoaded extends ProductState {
  final ProductDetails productDetails;

  ProductDetailsLoaded({required this.productDetails});
}

class ProductError extends ProductState {
  final String errorMessage;

  ProductError({required this.errorMessage});
}