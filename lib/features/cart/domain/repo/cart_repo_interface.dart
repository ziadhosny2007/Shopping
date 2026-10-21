import 'package:shopping/core/model/item/product_item_entity.dart';
import 'package:shopping/core/network/result.dart';

abstract class CartRepoInterface {
  Future<Result<String>> addToCart(String id);
  Future<Result<String>> deleteFromCart(String id);
  Future<Result<List<ProductItemEntity>>> getProductFromCart();
}
