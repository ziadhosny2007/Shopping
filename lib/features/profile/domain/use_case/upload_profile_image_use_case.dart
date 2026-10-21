
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/profile/domain/repo/profile_repo_interface.dart';

@injectable
class UploadProfileImageUseCase {
  final ProfileRepoInterface _repo;

  UploadProfileImageUseCase(this._repo);

  Future<Result<String>> invoke(File image) {
    return _repo.uploadProfileImage(image);
  }
}
