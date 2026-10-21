import 'package:injectable/injectable.dart';
import 'package:shopping/core/model/item/product_item_dto.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/cart/data/api/cart_api_interface.dart';
import 'package:shopping/features/cart/domain/repo/cart_data_source_interface.dart';

@Injectable(as: CartDataSourceInterface)
class CartDataSourceImp implements CartDataSourceInterface {
  final CartApiInterface _api;
  CartDataSourceImp(this._api);
  @override
  Future<Result<String>> addToCart(String id) async => await _api.addToCart(id);

  @override
  Future<Result<String>> deleteFromCart(String id) async =>
      await _api.deleteFromCart(id);

  @override
  Future<Result<List<ProductItemDto>>> getProductFromCart() async =>
      await _api.getProductFromCart();
}
