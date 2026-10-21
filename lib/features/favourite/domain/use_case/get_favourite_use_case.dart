import 'package:injectable/injectable.dart';
import 'package:shopping/core/model/item/product_item_entity.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/favourite/domain/repo/favourite_repo_interface.dart';

@injectable
class GetFavouriteUseCase {
  final FavouriteRepoInterface _repo;
  GetFavouriteUseCase(this._repo);
  Future<Result<List<ProductItemEntity>>> invoke() async =>
      _repo.getProductFromFavourite();
}
