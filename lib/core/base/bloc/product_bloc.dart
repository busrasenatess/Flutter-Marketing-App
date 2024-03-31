import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../init/locale_storage/locale_storage_manager.dart';
import '../functions/base_functions.dart';
import '../model/product_model.dart';
import '../service/i_product_service.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final IProductService _productService;
  ProductBloc(this._productService) : super(ProductInitial()) {
    on<FetchAllProducts>((event, emit) async {
      try {
        emit(ProductsLoading());
        var response = await _productService.fetchAllProductS();
        emit(ProductsLoaded(response));
      } catch (e) {
        emit(ProductLoadError(e.toString()));
      }
    });

    on<SearchProducts>((event, emit) async {
      try {
        emit(ProductsLoading());
        var response = await _productService.searchProducts(searchWord: event.searchWord);
        emit(ProductsLoaded(response));
      } catch (e) {
        emit(ProductLoadError(e.toString()));
      }
    });

    on<FetchProductByCategory>((event, emit) async {
      try {
        emit(ProductsLoading());
        var response = await _productService.fetchAllProductsByCategory(categoryName: event.categoryName);
        emit(ProductsLoaded(response));
      } catch (e) {
        emit(ProductLoadError(e.toString()));
      }
    });

    on<FetchAllFavoritesProducts>((event, emit) async {
      try {
        emit(ProductsLoading());
        List<ProductModel> products = [];
        var favorites = await LocalStorageManager.getStringList("favorites");
        if (favorites != null) {
          for (var item in favorites) {
            var product = await _productService.fetchProductById(productId: int.parse(item));
            products.add(product);
          }
        }
        emit(ProductsLoaded(products));
      } catch (e) {
        emit(ProductLoadError(e.toString()));
      }
    });

    on<FetchAllBasketProducts>((event, emit) async {
      try {
        emit(ProductsLoading());
        List<ProductModel> products = [];
        var favorites = await LocalStorageManager.getStringList("basket");
        if (favorites != null) {
          for (var item in favorites) {
            var product = await _productService.fetchProductById(productId: int.parse(item));
            products.add(product);
          }
        }

        emit(ProductsLoaded(products));
      } catch (e) {
        emit(ProductLoadError(e.toString()));
      }
    });

    on<AddOrRemoveProductFromFavorites>((event, emit) async {
      try {
        emit(UpdatingFavorites());
        await BaseFunctions.instance?.addOrRemoveProductListLocaleStorage(
          event.context,
          key: "favorites",
          productId: event.productId,
        );
        emit(UpdatedFavorites());
      } catch (e) {
        emit(UpdateFavoriteError(e.toString()));
      }
    });

    on<AddOrRemoveProductFromBasket>((event, emit) async {
      try {
        emit(UpdatingBasket());

        await BaseFunctions.instance?.addOrRemoveProductListLocaleStorage(
          event.context,
          key: "basket",
          productId: event.productId,
        );
        emit(UpdatedBasket());
      } catch (e) {
        emit(UpdateBasketError(e.toString()));
      }
    });

    on<ClearBasket>((event, emit) async {
      try {
        emit(UpdatingBasket());
        await LocalStorageManager.setStringList("basket", []);
        emit(UpdatedBasket());
      } catch (e) {
        emit(UpdateBasketError(e.toString()));
      }
    });
  }
}
