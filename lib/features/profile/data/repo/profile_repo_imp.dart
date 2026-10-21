import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/profile/domain/entities/profile_entity.dart';
import 'package:shopping/features/profile/domain/repo/profile_data_source_interface.dart';
import 'package:shopping/features/profile/domain/repo/profile_repo_interface.dart';

@Injectable(as: ProfileRepoInterface)
class ProfileRepoImp implements ProfileRepoInterface {
  final ProfileDataSourceInterface _dataSource;
  ProfileRepoImp(this._dataSource);
  @override
  Future<Result<ProfileEntity>> getUserData() async {
    final res = await _dataSource.getUserData();
    switch (res) {
      case Success():
        return Success(res.data.toEntity());
      case Error():
        return Error(res.error);
    }
  }

  @override
  Future<Result<String>> uploadProfileImage(File image) async {
    final res = await _dataSource.uploadProfileImage(image);
    switch (res) {
      case Success():
        return Success(res.data);
      case Error():
        return Error(res.error);
    }
  }

  @override
  Future<Result<String>> submitData(ProfileEntity data) async {
    final res = await _dataSource.submitData(data.toDto());
    switch (res) {
      case Success():
        return Success(res.data);
      case Error():
        return Error(res.error);
    }
  }
}
