abstract class ProductEvent {}

class FetchProducts extends ProductEvent {
  final bool reset;

  FetchProducts({this.reset = false});
}

class FetchProductDetails extends ProductEvent {
  final String productId;

  FetchProductDetails({required this.productId});
}