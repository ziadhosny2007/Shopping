import 'package:injectable/injectable.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/profile/domain/entities/profile_entity.dart';
import 'package:shopping/features/profile/domain/repo/profile_repo_interface.dart';

@injectable
class SubmitDataUseCase {
  final ProfileRepoInterface _repo;
  SubmitDataUseCase(this._repo);
  Future<Result<String>> invoke(ProfileEntity data) async =>
      await _repo.submitData(data);
}
