import 'package:injectable/injectable.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/home/data/api/home_product_api_interface.dart';
import 'package:shopping/features/home/domain/entities/categories_response_entity.dart';
import 'package:shopping/features/home/domain/entities/item_entity.dart';
import 'package:shopping/features/home/domain/repo/home_data_source_interface.dart';

@Injectable(as: HomeDataSourceInterface)
class HomeDataSourceImp implements HomeDataSourceInterface {
  final HomeProductApiInterface _api;

  HomeDataSourceImp(this._api);

  @override
  Future<Result<List<ItemEntity>>> getAllProducts({
    int skip = 0,
    int limit = 20,
  }) {
    return _api.getAllProducts(skip: skip, limit: limit);
  }

  @override
  Future<Result<List<CategoriesItemResponseEntity>>> getAllCategories() {
    return _api.getAllCategories();
  }
}
