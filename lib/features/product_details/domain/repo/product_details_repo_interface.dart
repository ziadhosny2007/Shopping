import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/product_details/domain/entities/product_details_entity.dart';

abstract class ProductDetailsRepoInterface {
  Future<Result<ProductDetailsEntity>> getProductDetails(int id);
}
