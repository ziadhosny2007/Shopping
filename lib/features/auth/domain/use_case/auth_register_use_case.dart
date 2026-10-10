import 'package:injectable/injectable.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/auth/domain/entities/auth_register_entity.dart';
import 'package:shopping/features/auth/domain/repo/auth_repo_interface.dart';

@injectable
class AuthRegisterUseCase {
  final AuthRepoInterface _repo;
  AuthRegisterUseCase(this._repo);

  Future<Result<String>> invoke(AuthRegisterEntity auth) async =>
      await _repo.register(auth);
}
