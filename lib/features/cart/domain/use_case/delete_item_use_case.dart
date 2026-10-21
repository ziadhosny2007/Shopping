import 'package:injectable/injectable.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/cart/domain/repo/cart_repo_interface.dart';

@injectable
class DeleteItemFromCartUseCase {
  final CartRepoInterface _repo;
  DeleteItemFromCartUseCase(this._repo);
  Future<Result<String>> invoke(String id) async => _repo.deleteFromCart(id);
}
