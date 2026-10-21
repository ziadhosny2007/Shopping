import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/profile/data/api/profile_api_interface.dart';
import 'package:shopping/features/profile/data/models/profile_dto.dart';
import 'package:shopping/features/profile/domain/repo/profile_data_source_interface.dart';

@Injectable(as: ProfileDataSourceInterface)
class ProfileDataSourceImp implements ProfileDataSourceInterface {
  final ProfileApiInterface _api;
  ProfileDataSourceImp(this._api);
  @override
  Future<Result<ProfileDto>> getUserData() async => await _api.getUserData();

  @override
  Future<Result<String>> uploadProfileImage(File image) async =>
      await _api.uploadProfileImage(image);

  @override
  Future<Result<String>> submitData(ProfileDto data) async =>
      await _api.submitData(data);
}
