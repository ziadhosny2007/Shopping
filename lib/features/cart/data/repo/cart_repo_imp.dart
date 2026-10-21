import 'package:injectable/injectable.dart';
import 'package:shopping/core/model/item/product_item_entity.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/cart/domain/repo/cart_data_source_interface.dart';
import 'package:shopping/features/cart/domain/repo/cart_repo_interface.dart';

@Injectable(as: CartRepoInterface)
class CartRepoImp implements CartRepoInterface {
  final CartDataSourceInterface _dataSource;
  CartRepoImp(this._dataSource);
  @override
  Future<Result<String>> addToCart(String id) async {
    final res = await _dataSource.addToCart(id);
    switch (res) {
      case Success():
        return Success(res.data);

      case Error():
        return Error(res.error);
    }
  }

  @override
  Future<Result<String>> deleteFromCart(String id) async {
    final res = await _dataSource.deleteFromCart(id);
    switch (res) {
      case Success():
        return Success(res.data);

      case Error():
        return Error(res.error);
    }
  }

  @override
  Future<Result<List<ProductItemEntity>>> getProductFromCart() async {
    final res = await _dataSource.getProductFromCart();
    switch (res) {
      case Success():
        return Success(res.data.map((e) => e.toEntity()).toList());

      case Error():
        return Error(res.error);
    }
  }
}
