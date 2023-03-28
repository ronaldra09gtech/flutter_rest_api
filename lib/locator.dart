import 'package:get_it/get_it.dart';
import 'package:flutter_rest_api/services/product_service.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<ProductService>(() => ProductService());
}