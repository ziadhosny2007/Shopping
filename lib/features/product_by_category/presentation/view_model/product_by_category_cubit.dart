import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/product_by_category/domain/entities/product_by_category_entity.dart';
import 'package:shopping/features/product_by_category/domain/use_case/product_by_category_use_case.dart';

part 'product_by_category_state.dart';

@injectable
class ProductByCategoryCubit extends Cubit<ProductByCategoryState> {
  ProductByCategoryCubit(this.useCase) : super(ProductByCategoryInitial());

  final ProductByCategoryUseCase useCase;

  final List<ItemsEntity> _items = [];

  int _skip = 0;
  final int _limit = 5;

  bool _isFetching = false;
  bool _hasReachedMax = false;

  void intent(Intent intent, String slug) async {
    switch (intent) {
      case GetProductByCategories():
        return await getProductByCategory(slug);
    }
  }

  Future<void> getProductByCategory(String slug) async {
    if (_isFetching || _hasReachedMax) return;

    _isFetching = true;

    final isFirstPage = _items.isEmpty;

    if (isFirstPage) {
      emit(StateLoading());
    } else {
      emit(StateSuccess(List.of(_items), isLoadingMore: true));
    }

    final result = await useCase.invoke(slug, skip: _skip, limit: _limit);

    switch (result) {
      case Success<ProductByCategoryEntity>():
        final ProductByCategoryEntity response = result.data;
        final newItems = response.list;

        _items.addAll(newItems);

        _skip += newItems.length;

        _hasReachedMax =
            _items.length >= response.total || newItems.length < _limit;

        emit(StateSuccess(List.of(_items), hasReachedMax: _hasReachedMax));

      case Error<ProductByCategoryEntity>():
        if (_items.isEmpty) {
          emit(StateError(result.error));
        } else {
          emit(StateSuccess(List.of(_items), hasReachedMax: _hasReachedMax));
        }
    }

    _isFetching = false;
  }
}

class Intent {}

class GetProductByCategories extends Intent {}
