import 'package:injectable/injectable.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/home/domain/entities/categories_response_entity.dart';
import 'package:shopping/features/home/domain/entities/item_entity.dart';
import 'package:shopping/features/home/domain/repo/home_data_source_interface.dart';
import 'package:shopping/features/home/domain/repo/home_repo_interface.dart';

@Injectable(as: HomeRepoInterface)
class HomeRepoImp implements HomeRepoInterface {
  final HomeDataSourceInterface _data;
  HomeRepoImp(this._data);
  @override
  Future<Result<List<ItemEntity>>> getAllProducts({
    int skip = 0,
    int limit = 20,
  }) async => await _data.getAllProducts(skip: skip, limit: limit);

  @override
  Future<Result<List<CategoriesItemResponseEntity>>> getAllCategories() async =>
      await _data.getAllCategories();
}
