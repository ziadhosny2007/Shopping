import 'package:shopping/core/model/item/product_item_entity.dart';
import 'package:shopping/core/network/result.dart';

abstract class FavouriteRepoInterface {
  Future<Result<String>> addToFavourite(String id);
  Future<Result<String>> deleteFromFavourite(String id);
  Future<Result<List<ProductItemEntity>>> getProductFromFavourite();
}
