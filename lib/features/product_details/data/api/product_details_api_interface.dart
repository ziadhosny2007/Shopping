import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/product_details/data/models/product_details_dtao.dart';

abstract class ProductDetailsApiInterface {
  Future<Result<ProductDetailsDto>> getProductDetails(int id);
}
