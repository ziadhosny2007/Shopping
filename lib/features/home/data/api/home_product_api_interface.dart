import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/home/domain/entities/categories_response_entity.dart';
import 'package:shopping/features/home/domain/entities/item_entity.dart';

abstract class HomeProductApiInterface {
  Future<Result<List<ItemEntity>>> getAllProducts({
    int skip = 0,
    int limit = 20,
  });

   Future<Result<List<CategoriesItemResponseEntity>>> getAllCategories();
}
