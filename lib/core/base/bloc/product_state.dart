part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductsLoaded extends ProductState {
  final List<ProductModel> productList;

  ProductsLoaded(this.productList);
}

class ProductsLoading extends ProductState {}

class ProductLoadError extends ProductState {
  final String errorMessage;

  ProductLoadError(this.errorMessage);
}

class UpdatingBasket extends ProductState {}

class UpdatedBasket extends ProductState {}

class UpdateBasketError extends ProductState {
  final String errorMessage;

  UpdateBasketError(this.errorMessage);
}

class UpdatingFavorites extends ProductState {}

class UpdatedFavorites extends ProductState {}

class UpdateFavoriteError extends ProductState {
  final String errorMessage;

  UpdateFavoriteError(this.errorMessage);
}
