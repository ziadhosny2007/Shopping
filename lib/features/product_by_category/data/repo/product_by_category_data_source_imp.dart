import 'package:injectable/injectable.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/product_by_category/data/api/product_by_category_api_interface.dart';
import 'package:shopping/features/product_by_category/data/models/product_by_category_dto.dart';
import 'package:shopping/features/product_by_category/domain/repo/product_by_category_data_source_interface.dart';

@Injectable(as: ProductByCategoryDataSourceInterface)
class ProductByCategoryDataSourceImp
    implements ProductByCategoryDataSourceInterface {
  final ProductByCategoryApiInterface _api;

  ProductByCategoryDataSourceImp(this._api);

  @override
  Future<Result<ProductByCategoryDto>> getProductByCategory(
    String slug, {
    int skip = 0,
    int limit = 10,
  }) async {
    final res = await _api.getProductByCategory(slug, limit: limit, skip: skip);
    switch (res) {
      case Success():
        return Success(res.data);
      case Error():
        return Error(res.error);
    }
  }
}
