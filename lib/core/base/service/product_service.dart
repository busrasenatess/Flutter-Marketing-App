import 'package:vexana/vexana.dart';

import '../model/product_model.dart';
import '../model/result_model.dart';
import 'i_product_service.dart';

class ProductService extends IProductService {
  ProductService(super.networkManager);

  @override
  Future<List<ProductModel>> fetchAllProductS() async {
    var response = await networkManager.send("", parseModel: ResultModel(), method: RequestType.GET);
    return response.data.products;
  }

  @override
  Future<List<ProductModel>> fetchAllProductsByCategory({required String categoryName}) async {
    var response = await networkManager.send("/category/$categoryName", parseModel: ResultModel(), method: RequestType.GET);
    return response.data.products;
  }

  @override
  Future<ProductModel> fetchProductById({required int productId}) async {
    var response = await networkManager.send("/$productId", parseModel: ProductModel(), method: RequestType.GET);
    return response.data;
  }

  @override
  Future<List<ProductModel>> searchProducts({required String searchWord}) async {
    var response = await networkManager.send("/search", queryParameters: {"q": searchWord}, parseModel: ResultModel(), method: RequestType.GET);
    return response.data.products;
  }
}
