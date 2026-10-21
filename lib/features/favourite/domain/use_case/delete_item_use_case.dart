import 'package:injectable/injectable.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/favourite/domain/repo/favourite_repo_interface.dart';

@injectable
class DeleteItemUseCase {
  final FavouriteRepoInterface _repo;
  DeleteItemUseCase(this._repo);
  Future<Result<String>> invoke(String id) async =>
      _repo.deleteFromFavourite(id);
}
