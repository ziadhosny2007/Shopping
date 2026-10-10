import 'package:injectable/injectable.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/auth/domain/entities/auth_login_requst_entity.dart';
import 'package:shopping/features/auth/domain/entities/login_response_entity.dart';
import 'package:shopping/features/auth/domain/repo/auth_repo_interface.dart';

@injectable
class AuthLoginUseCase {
  final AuthRepoInterface _repo;
  AuthLoginUseCase(this._repo);

  Future<Result<LoginResponseEntity>> invoke(
    AuthLoginRequstEntity auth,
  ) async => await _repo.login(auth);
}
