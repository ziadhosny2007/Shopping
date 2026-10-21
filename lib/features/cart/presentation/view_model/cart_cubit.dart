import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/cart/domain/use_case/add_item_use_case.dart';
import 'package:shopping/features/cart/domain/use_case/delete_item_use_case.dart';
import 'package:shopping/features/cart/domain/use_case/get_cart_use_case.dart';

part 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  CartCubit(this.add, this.deleteItemUseCase, this.getFavouriteUseCase)
    : super(CartInitial());

  final AddItemToCartUseCase add;
  final DeleteItemFromCartUseCase deleteItemUseCase;
  final GetCartUseCase getFavouriteUseCase;

  Future<void> addToCart(String id) async {
    final result = await add.invoke(id);

    if (isClosed) return;

    switch (result) {
      case Success():
        emit(CartSuccess(result.data));
      case Error():
        emit(CartError(result.error));
    }
  }

  Future<void> deleteFromCart(String id) async {
    final result = await deleteItemUseCase.invoke(id);

    if (isClosed) return;

    switch (result) {
      case Success():
        emit(CartSuccess(result.data));
      case Error():
        emit(CartError(result.error));
    }
  }

  Future<void> getProductFromCart() async {
    emit(CartLoading());
    final result = await getFavouriteUseCase.invoke();

    if (isClosed) return;

    switch (result) {
      case Success():
        emit(CartSuccess(result.data));
      case Error():
        emit(CartError(result.error));
    }
  }
}
