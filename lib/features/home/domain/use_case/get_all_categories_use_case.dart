import 'package:injectable/injectable.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/home/domain/entities/categories_response_entity.dart';
import 'package:shopping/features/home/domain/repo/home_repo_interface.dart';

@injectable
class GetAllCategoriesUseCase {
  final HomeRepoInterface _repo;

  GetAllCategoriesUseCase(this._repo);
  Future<Result<List<CategoriesItemResponseEntity>>> invoke() async =>
      await _repo.getAllCategories();
}
