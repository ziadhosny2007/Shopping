import 'package:injectable/injectable.dart';
import 'package:shopping/core/model/item/product_item_entity.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/cart/domain/repo/cart_repo_interface.dart';

@injectable
class GetCartUseCase {
  final CartRepoInterface _repo;
  GetCartUseCase(this._repo);
  Future<Result<List<ProductItemEntity>>> invoke() async =>
      _repo.getProductFromCart();
}
