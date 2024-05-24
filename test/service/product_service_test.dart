import 'package:flutter_test/flutter_test.dart';
//import 'package:marketing_app/core/init/network/network_manager.dart';
//import 'package:marketing_app/core/base/service/i_product_service.dart';
//import 'package:marketing_app/core/base/service/product_service.dart';
import 'package:marketingapp/core/base/service/i_product_service.dart';
import 'package:marketingapp/core/base/service/product_service.dart';
import 'package:marketingapp/core/init/network/network_manager.dart';

void main() {
  late IProductService productService;
  setUp(() {
    productService = ProductService(VexanaManager());
  });
  test('Fetch All Products Service Test', () async {
    await productService.fetchAllProductS();
  });

  test('Fetch All Products By Category Service Test', () async {
    await productService.fetchAllProductsByCategory(categoryName: "smartphones");
  });

  test('Fetch All Products By Id Service Test', () async {
    await productService.fetchProductById(productId: 10);
  });

  test('Search Products  Service Test', () async {
    await productService.searchProducts(searchWord: "lapto");
  });
}
