import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/base/model/product_model.dart';
import '../../../core/base/service/productFilter/product_filter.dart';
import '../../../core/base/service/product_service.dart';
import '../../../core/components/notFound/notFound.dart';
import '../../../core/components/productCard/product_card.dart';
import '../../../core/components/scaffold/scaffold.dart';
import '../../../core/init/network/network_manager.dart';
import 'producT_display.dart';

@RoutePage()
class SearchProductView extends StatefulWidget {
  final String word;
  final bool isCategoryName;
  const SearchProductView({super.key, required this.word, this.isCategoryName = false});

  @override
  State<SearchProductView> createState() => _SearchProductViewState();
}

class _SearchProductViewState extends State<SearchProductView> {
  //TODO: USED BRIDGE PATTERN DESIGN

  ProductDisplay productDisplay = ProductDisplay(ProductFilter(ProductService(VexanaManager())));
  List<ProductModel> productList = [];
  bool isLoading = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      setState(() {
        isLoading = true;
      });
      if (widget.isCategoryName) {
        productList = await productDisplay.displayCategoryProducts(widget.word);
      } else {
        productList = await productDisplay.displaySearchProducts(widget.word);
      }
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        isLoading = false;
      });
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appbarTitle: "Search Product",
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : productList.isNotEmpty
              ? GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: 230, crossAxisSpacing: 10, mainAxisSpacing: 20),
                  itemCount: productList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var item = productList[index];
                    // ignore: prefer_const_constructors
                    return ProductCardWidget(
                      productModel: item,
                    );
                  },
                )
              : const NotFoundProductWidget(),
    );
  }
}
