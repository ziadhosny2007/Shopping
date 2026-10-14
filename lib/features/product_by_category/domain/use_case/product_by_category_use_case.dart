import 'package:injectable/injectable.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/product_by_category/domain/entities/product_by_category_entity.dart';
import 'package:shopping/features/product_by_category/domain/repo/product_by_category_repo_interface.dart';

@injectable
class ProductByCategoryUseCase {
  final ProductByCategoryRepoInterface _repo;
  ProductByCategoryUseCase(this._repo);
  Future<Result<ProductByCategoryEntity>> invoke(
    String slug, {
    int skip = 0,
    int limit = 10,
  }) async => await _repo.getProductByCategory(slug, limit: limit, skip: skip);
}
