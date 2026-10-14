import 'package:injectable/injectable.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/product_details/domain/entities/product_details_entity.dart';
import 'package:shopping/features/product_details/domain/repo/product_details_repo_interface.dart';

@injectable
class GetProductDetailsUseCase {
  final ProductDetailsRepoInterface _repo;
  GetProductDetailsUseCase(this._repo);
  Future<Result<ProductDetailsEntity>> invoke(int id) async =>
      await _repo.getProductDetails(id);
}
