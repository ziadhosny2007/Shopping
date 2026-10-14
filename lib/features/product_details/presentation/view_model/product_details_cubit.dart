import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/product_details/domain/entities/product_details_entity.dart';
import 'package:shopping/features/product_details/domain/use_case/get_product_details_use_case.dart';

part 'product_details_state.dart';

@injectable
class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this.useCase) : super(ProductDetailsInitial());
  final GetProductDetailsUseCase useCase;

  Future<void> intent(Intent intent, int id) async {
    switch (intent) {
      case GetProductDetails():
        await getProductDetails(id);
    }
  }

  Future<void> getProductDetails(int id) async {
    emit(ProductDetailsLoading());
    final res = await useCase.invoke(id);
    switch (res) {
      case Success():
        emit(ProductDetailsSuccess(res.data));
      case Error():
        emit(ProductDetailsError(res.error));
    }
  }
}

sealed class Intent {}

class GetProductDetails extends Intent {}
