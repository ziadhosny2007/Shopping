part of 'cart_cubit.dart';

abstract class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartSuccess<T> extends CartState {
  T data;
  CartSuccess(this.data);
}

final class CartError extends CartState {
  String error;
  CartError(this.error);
}
