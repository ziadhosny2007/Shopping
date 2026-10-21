part of 'favourite_cubit.dart';

sealed class FavouriteState {}

final class FavouriteInitial extends FavouriteState {}
final class FavouriteLoading extends FavouriteState {}


final class FavouriteSuccess<T> extends FavouriteState {
T data;
FavouriteSuccess(this.data);
}

final class FavouriteError extends FavouriteState {
  String error;
  FavouriteError(this.error);
}
