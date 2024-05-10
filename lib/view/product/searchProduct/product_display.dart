import '../../../core/base/model/product_model.dart';
import '../../../core/base/service/productFilter/product_filter.dart';
//TODO: USED BRIDGE PATTERN DESIGN
class ProductDisplay {
  final ProductFilter _productFilter;

  ProductDisplay(this._productFilter);

  Future<List<ProductModel>> displaySearchProducts(String searchName) async {
    var products = await _productFilter.filterToName(searchName);
    return products;
  }

  Future<List<ProductModel>> displayCategoryProducts(String category) async {
    var products = await _productFilter.filterToCategory(category);
    return products;
  }
}
