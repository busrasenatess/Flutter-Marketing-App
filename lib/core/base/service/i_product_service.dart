import 'package:vexana/vexana.dart';

import '../model/product_model.dart';

abstract class IProductService {
  final INetworkManager networkManager;

  IProductService(this.networkManager);

  Future<List<ProductModel>> fetchAllProductS();
  Future<ProductModel> fetchProductById({required int productId});
  Future<List<ProductModel>> searchProducts({required String searchWord});
  Future<List<ProductModel>> fetchAllProductsByCategory({required String categoryName});
}
