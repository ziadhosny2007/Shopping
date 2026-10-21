import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/search/data/models/search_dto.dart';

abstract class SearchApiInterface {
  Future<Result<List<SearchItemDto>>> search(String name);
}
