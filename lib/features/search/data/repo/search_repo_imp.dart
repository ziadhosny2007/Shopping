import 'package:injectable/injectable.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/search/domain/entities/search_entity.dart';
import 'package:shopping/features/search/domain/repo/search_data_source_interface.dart';
import 'package:shopping/features/search/domain/repo/search_repo_interface.dart';

@Injectable(as: SearchRepoInterface)
class SearchRepoImp implements SearchRepoInterface {
  final SearchDataSourceInterface _dataSource;
  SearchRepoImp(this._dataSource);
  @override
  Future<Result<List<SearchItemEntity>>> search(String name) async {
    final res = await _dataSource.search(name);
    switch (res) {
      case Success():
        return Success(res.data.map((e) => e.toEntity()).toList());
      case Error():
        return Error(res.error);
    }
  }
}
