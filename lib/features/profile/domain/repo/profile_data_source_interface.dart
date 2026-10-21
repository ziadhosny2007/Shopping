import 'dart:io';

import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/profile/data/models/profile_dto.dart';

abstract class ProfileDataSourceInterface {
  Future<Result<ProfileDto>> getUserData();

  Future<Result<String>> uploadProfileImage(File image);
  Future<Result<String>> submitData(ProfileDto data);
}
