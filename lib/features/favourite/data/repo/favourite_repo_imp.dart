import 'package:injectable/injectable.dart';
import 'package:shopping/core/model/item/product_item_entity.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/favourite/domain/repo/favourite_data_source_interface.dart';
import 'package:shopping/features/favourite/domain/repo/favourite_repo_interface.dart';

@Injectable(as: FavouriteRepoInterface)
class FavouriteRepoImp implements FavouriteRepoInterface {
  final FavouriteDataSourceInterface _dataSource;
  FavouriteRepoImp(this._dataSource);
  @override
  Future<Result<String>> addToFavourite(String id) async {
    final res = await _dataSource.addToFavourite(id);
    switch (res) {
      case Success():
        return Success(res.data);

      case Error():
        return Error(res.error);
    }
  }

  @override
  Future<Result<String>> deleteFromFavourite(String id) async {
    final res = await _dataSource.deleteFromFavourite(id);
    switch (res) {
      case Success():
        return Success(res.data);

      case Error():
        return Error(res.error);
    }
  }

  @override
  Future<Result<List<ProductItemEntity>>> getProductFromFavourite() async {
    var res = await _dataSource.getProductFromFavourite();

    switch (res) {
      case Success():
        return Success(res.data.map((e) => e.toEntity()).toList());

      case Error():
        return Error(res.error);
    }
  }
}
