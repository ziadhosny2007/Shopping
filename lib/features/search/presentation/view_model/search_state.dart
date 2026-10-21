part of 'search_cubit.dart';

sealed class SearchState<T> {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess<T> extends SearchState<T> {
T data;
SearchSuccess(this.data);
}

class SearchError extends SearchState {
  String error;
  SearchError(this.error);
}
