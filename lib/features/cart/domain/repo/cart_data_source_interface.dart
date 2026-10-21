import 'package:shopping/core/model/item/product_item_dto.dart';
import 'package:shopping/core/network/result.dart';

abstract class CartDataSourceInterface {
  Future<Result<String>> addToCart(String id);
  Future<Result<String>> deleteFromCart(String id);
      Future<Result<List<ProductItemDto>>>getProductFromCart();

}
