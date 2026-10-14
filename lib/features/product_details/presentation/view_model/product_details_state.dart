part of 'product_details_cubit.dart';

sealed class ProductDetailsState<T> {}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsSuccess<T> extends ProductDetailsState <T>{
  ProductDetailsEntity data;
  ProductDetailsSuccess(this.data);
}

class ProductDetailsError extends ProductDetailsState {
  String error;
  ProductDetailsError(this.error);
}
