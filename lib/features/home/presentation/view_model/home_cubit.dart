import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/home/domain/entities/categories_response_entity.dart';
import 'package:shopping/features/home/domain/entities/item_entity.dart';
import 'package:shopping/features/home/domain/use_case/get_all_categories_use_case.dart';
import 'package:shopping/features/home/domain/use_case/get_item_use_case.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.useCase, this.categoriesUseCase) : super(StateLoading());

  final GetItemUseCase useCase;
  final GetAllCategoriesUseCase categoriesUseCase;

  final List<ItemEntity> _items = [];
  int _skip = 0;
  int _limit = 20;

  bool _isFetching = false;
  bool _hasReachedMax = false;

  void intent(Intent intent) {
    switch (intent) {
      case GetAllCategories():
        getAllCategories();
      case GetAllProducts():
        getAllProducts();
      case GetCallBoth():
        Future.wait([getAllProducts(), getAllCategories()]);
    }
  }

  Future<void> getAllProducts() async {
    if (_isFetching || _hasReachedMax) return;

    _isFetching = true;

    final isFirstPage = _items.isEmpty;

    if (isFirstPage) {
      emit(StateLoading());
    } else {
      emit(StateSuccess(List.of(_items), isLoadingMore: true));
    }

    try {
      final result = await useCase.invoke(skip: _skip, limit: _limit);

      switch (result) {
        case Success():
          final List<ItemEntity> newItems = result.data;

          _items.addAll(newItems);
          _skip += newItems.length;
          _hasReachedMax = newItems.length < _limit;

          emit(StateSuccess(List.of(_items), hasReachedMax: _hasReachedMax));

        case Error():
          if (_items.isEmpty) {
            emit(StateError(result.error));
          } else {
            emit(StateSuccess(List.of(_items)));
          }
      }
    } catch (e) {
      if (_items.isEmpty) {
        emit(StateError(e.toString()));
      } else {
        emit(StateSuccess(List.of(_items)));
      }
    } finally {
      _isFetching = false;
    }
  }

  Future<void> getAllCategories() async {
    emit(CategoryLoading());
    final result = await categoriesUseCase.invoke();
    switch (result) {
      case Success():
        emit(CategorySuccess(result.data));
      case Error():
        emit(CategoryError(result.error));
    }
  }
}

class Intent {}

class GetAllCategories extends Intent {}

class GetAllProducts extends Intent {}

class GetCallBoth extends Intent {}
