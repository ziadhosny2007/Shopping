import 'package:injectable/injectable.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/product_by_category/domain/entities/product_by_category_entity.dart';
import 'package:shopping/features/product_by_category/domain/repo/product_by_category_data_source_interface.dart';
import 'package:shopping/features/product_by_category/domain/repo/product_by_category_repo_interface.dart';

@Injectable(as: ProductByCategoryRepoInterface)
class ProductByCategoryRepoImp implements ProductByCategoryRepoInterface {
  final ProductByCategoryDataSourceInterface _dataSource;
  ProductByCategoryRepoImp(this._dataSource);
  @override
  Future<Result<ProductByCategoryEntity>> getProductByCategory(
    String slug, {
    int skip = 0,
    int limit = 20,
  }) async {
    final res = await _dataSource.getProductByCategory(
      slug,
      limit: limit,
      skip: skip,
    );
    switch (res) {
      case Success():
        return Success(res.data.toEntity());

      case Error():
        return Error(res.error);
    }
  }
}
