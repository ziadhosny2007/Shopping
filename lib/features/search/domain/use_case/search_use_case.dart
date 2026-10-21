import 'package:injectable/injectable.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/search/domain/entities/search_entity.dart';
import 'package:shopping/features/search/domain/repo/search_repo_interface.dart';

@injectable
class SearchUseCase {
  final SearchRepoInterface _repo;
  SearchUseCase(this._repo);
  Future<Result<List<SearchItemEntity>>> invoke(String name) async =>
      await _repo.search(name);
}
