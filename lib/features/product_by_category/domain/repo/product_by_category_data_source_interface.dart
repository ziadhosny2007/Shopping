import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/product_by_category/data/models/product_by_category_dto.dart';

abstract class ProductByCategoryDataSourceInterface {
  Future<Result<ProductByCategoryDto>> getProductByCategory(
    String slug, {
    int skip = 0,
    int limit = 10,
  });
}
