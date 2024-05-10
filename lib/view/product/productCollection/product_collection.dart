import '../../../core/base/model/product_model.dart';
import '../productIterator/product_iterator.dart';

//TODO: USED ITERATOR PATTERN DESIGN

class ProductCollection {
  final List<ProductModel> products;

  ProductCollection(this.products);

  ProductIterator getIterator() {
    return ProductIterator(this);
  }
}
