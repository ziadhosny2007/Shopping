import 'package:injectable/injectable.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/profile/domain/entities/profile_entity.dart';
import 'package:shopping/features/profile/domain/repo/profile_repo_interface.dart';

@injectable
class ProfileUseCase {
  final ProfileRepoInterface _repo;
  ProfileUseCase(this._repo);
  Future<Result<ProfileEntity>> invoke() async => await _repo.getUserData();
}
