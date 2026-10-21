import 'package:shopping/core/model/item/product_item_dto.dart';
import 'package:shopping/core/network/result.dart';

abstract class FavouriteApiInterface {
  Future<Result<String>> addToFavourite(String id);
  Future<Result<String>> deleteFromFavourite(String id);
  Future<Result<List<ProductItemDto>>>getProductFromFavourite();
}
