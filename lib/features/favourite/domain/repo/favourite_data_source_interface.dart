import 'package:shopping/core/model/item/product_item_dto.dart';
import 'package:shopping/core/network/result.dart';

abstract class FavouriteDataSourceInterface {
  Future<Result<String>> addToFavourite(String id);
  Future<Result<String>> deleteFromFavourite(String id);
  Future<Result<List<ProductItemDto>>> getProductFromFavourite();
}
