import '../../model/product_model.dart';
import '../i_product_service.dart';
//TODO: USED BRIDGE PATTERN DESIGN

class ProductFilter {
  final IProductService _dataSource;

  ProductFilter(this._dataSource);

  Future<List<ProductModel>> filterToName(String searchName) async {
    return await _dataSource.searchProducts(searchWord: searchName);
  }

  Future<List<ProductModel>> filterToCategory(String category) async {
    return await _dataSource.fetchAllProductsByCategory(categoryName: category);
  }
}
