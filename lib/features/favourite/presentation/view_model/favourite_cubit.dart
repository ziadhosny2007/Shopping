import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/favourite/domain/use_case/add_item_use_case.dart';
import 'package:shopping/features/favourite/domain/use_case/delete_item_use_case.dart';
import 'package:shopping/features/favourite/domain/use_case/get_favourite_use_case.dart';

part 'favourite_state.dart';

@injectable
class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit(this.add, this.deleteItemUseCase, this.getFavouriteUseCase)
    : super(FavouriteInitial());

  final AddItemToFavouriteUseCase add;
  final DeleteItemUseCase deleteItemUseCase;
  final GetFavouriteUseCase getFavouriteUseCase;

  Future<void> addToFavorite(String id) async {
    final result = await add.invoke(id);

    if (isClosed) return;

    switch (result) {
      case Success():
        emit(FavouriteSuccess(result.data));
      case Error():
        emit(FavouriteError(result.error));
    }
  }

  Future<void> deleteFromFavourite(String id) async {
    final result = await deleteItemUseCase.invoke(id);

    if (isClosed) return;

    switch (result) {
      case Success():
        emit(FavouriteSuccess(result.data));
      case Error():
        emit(FavouriteError(result.error));
    }
  }

  Future<void> getProductFromFavourite() async {
    emit(FavouriteLoading());
    final result = await getFavouriteUseCase.invoke();

    if (isClosed) return;

    switch (result) {
      case Success():
        emit(FavouriteSuccess(result.data));
      case Error():
        emit(FavouriteError(result.error));
    }
  }
}
