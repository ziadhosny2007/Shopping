import 'package:injectable/injectable.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/home/domain/entities/item_entity.dart';
import 'package:shopping/features/home/domain/repo/home_repo_interface.dart';

@injectable
class GetItemUseCase {
  final HomeRepoInterface _repo;

  GetItemUseCase(this._repo);
  Future<Result<List<ItemEntity>>> invoke({
    int skip = 0,
    int limit = 20,
  }) async => await _repo.getAllProducts(limit: limit, skip: skip);
}
