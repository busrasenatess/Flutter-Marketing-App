import '../../../core/base/model/product_model.dart';
import '../productCollection/product_collection.dart';
// USED ITERATOR PATTERN DESIGN 

class ProductIterator {
  final ProductCollection _collection;
  int _current = 0;

  ProductIterator(this._collection);

  bool hasNext() {
    return _current < _collection.products.length;
  }

  ProductModel next() {
    return _collection.products[_current++];
  }
}
