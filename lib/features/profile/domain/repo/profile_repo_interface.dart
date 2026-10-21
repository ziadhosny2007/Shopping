import 'dart:io';

import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/profile/domain/entities/profile_entity.dart';

abstract class ProfileRepoInterface {
  Future<Result<ProfileEntity>> getUserData();

  Future<Result<String>> uploadProfileImage(File image);
  Future<Result<String>> submitData(ProfileEntity data);
}
