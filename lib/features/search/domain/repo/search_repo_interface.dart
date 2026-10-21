import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/search/domain/entities/search_entity.dart';

abstract class SearchRepoInterface {
  Future<Result<List<SearchItemEntity>>> search(String name);
}
