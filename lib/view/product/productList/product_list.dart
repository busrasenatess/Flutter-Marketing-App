import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/components/productCard/product_card.dart';
import '../productCollection/product_collection.dart';

//TODO: USED ITERATOR PATTERN DESIGN

class ProductList extends StatelessWidget {
  final ProductCollection _collection;

  const ProductList(this._collection, {super.key});

  @override
  Widget build(BuildContext context) {
    var iterator = _collection.getIterator();
    var products = <Widget>[];
    while (iterator.hasNext()) {
      var product = iterator.next();
      products.add(ProductCardWidget(
        productModel: product,
      ));
    }
    return GridView.builder(
      padding: context.padding.low,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 230,
        mainAxisSpacing: 10,
        crossAxisSpacing: 20,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        var item = products[index];
        return item;
      },
    );
  }
}
