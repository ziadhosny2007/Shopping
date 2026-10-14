import 'package:injectable/injectable.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/product_details/domain/entities/product_details_entity.dart';
import 'package:shopping/features/product_details/domain/repo/product_details_data_source_interface.dart';
import 'package:shopping/features/product_details/domain/repo/product_details_repo_interface.dart';

@Injectable(as: ProductDetailsRepoInterface)
class ProductDetailsRepoImp implements ProductDetailsRepoInterface {
  final ProductDetailsDataSourceInterface _dataSource;
  ProductDetailsRepoImp(this._dataSource);
  @override
  Future<Result<ProductDetailsEntity>> getProductDetails(int id) async {
    final res = await _dataSource.getProductDetails(id);
    switch (res) {
      case Success():
        return Success(res.data.toEntity());
      case Error():
        return Error(res.error);
    }
  }
}
