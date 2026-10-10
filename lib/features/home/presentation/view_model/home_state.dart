part of 'home_cubit.dart';

sealed class HomeState<T> {}

class HomeInitial extends HomeState {}

class StateLoading extends HomeState {}

class StateSuccess<T> extends HomeState<T> {
  final T data;
  final bool isLoadingMore;
  final bool hasReachedMax;

  StateSuccess(
    this.data, {
    this.isLoadingMore = false,
    this.hasReachedMax = false,
  });
}

class StateError extends HomeState {
  String error;
  StateError(this.error);
}

class CategoryLoading extends HomeState {}

class CategorySuccess extends HomeState {
  List<CategoriesItemResponseEntity> categories;
  CategorySuccess(this.categories);
}

class CategoryError extends HomeState {
  String error;
  CategoryError(this.error);
}
