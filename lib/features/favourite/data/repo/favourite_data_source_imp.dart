import 'package:injectable/injectable.dart';
import 'package:shopping/core/model/item/product_item_dto.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/favourite/data/api/favourite_api_interface.dart';
import 'package:shopping/features/favourite/domain/repo/favourite_data_source_interface.dart';

@Injectable(as: FavouriteDataSourceInterface)
class FavouriteDataSourceImp implements FavouriteDataSourceInterface {
  final FavouriteApiInterface _api;
  FavouriteDataSourceImp(this._api);
  @override
  Future<Result<String>> addToFavourite(String id) async =>
      await _api.addToFavourite(id);

  @override
  Future<Result<String>> deleteFromFavourite(String id) async =>
      await _api.deleteFromFavourite(id);

  @override
  Future<Result<List<ProductItemDto>>> getProductFromFavourite() async =>
      await _api.getProductFromFavourite();
}
