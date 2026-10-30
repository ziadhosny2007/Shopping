part of 'product_by_category_cubit.dart';

sealed class ProductByCategoryState {}

final class ProductByCategoryInitial extends ProductByCategoryState {}

class StateLoading extends ProductByCategoryState {}

class StateSuccess<T> extends ProductByCategoryState {
  final T data;
  final bool isLoadingMore;
  final bool hasReachedMax;

  StateSuccess(
    this.data, {
    this.isLoadingMore = false,
    this.hasReachedMax = false,
  });
}

// ignore: must_be_immutable
class StateError extends ProductByCategoryState {
  String error;
  StateError(this.error);
}
