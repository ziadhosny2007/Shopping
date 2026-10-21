import 'package:injectable/injectable.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/search/data/api/search_api_interface.dart';
import 'package:shopping/features/search/data/models/search_dto.dart';
import 'package:shopping/features/search/domain/repo/search_data_source_interface.dart';

@Injectable(as: SearchDataSourceInterface)
class SearchDataSourceImp implements SearchDataSourceInterface {
  final SearchApiInterface _api;
  SearchDataSourceImp(this._api);
  @override
  Future<Result<List<SearchItemDto>>> search(String name) async =>
      _api.search(name);
}
