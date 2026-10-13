import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/product_by_category/domain/entities/product_by_category_entity.dart';

abstract class ProductByCategoryRepoInterface {
  Future<Result<ProductByCategoryEntity>> getProductByCategory(
    String slug, {
    int skip = 0,
    int limit = 20,
  });
}
