import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:betterask_exam/bloc/product_event.dart';
import 'package:betterask_exam/bloc/product_state.dart';
import 'package:betterask_exam/locator.dart';
import 'package:betterask_exam/models/product.dart';
import 'package:betterask_exam/models/product_details.dart';
import 'package:betterask_exam/services/product_service.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductService _productService = locator<ProductService>();
  int _limit = 10;
  int _skip = 0;

  ProductBloc() : super(ProductLoading());

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is FetchProducts) {
      try {
        if (event.reset) {
          _skip = 0;
        }
        List<Product> products = await _productService.fetchProducts(limit: _limit, skip: _skip);
        _skip += _limit;
        yield ProductLoaded(products: products, hasReachedMax: products.length < _limit);
      } catch (error) {
        yield ProductError(errorMessage: error.toString());
      }
    } else if (event is FetchProductDetails) {
      try {
        ProductDetails productDetails = await _productService.fetchProductDetails(event.productId);
        yield ProductDetailsLoaded(productDetails: productDetails);
      } catch (error) {
        yield ProductError(errorMessage: error.toString());
      }
    }
  }
}