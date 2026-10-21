import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/profile/domain/entities/profile_entity.dart';
import 'package:shopping/features/profile/domain/use_case/profile_use_case.dart';
import 'package:shopping/features/profile/domain/use_case/submit_data_use_case.dart';
import 'package:shopping/features/profile/domain/use_case/upload_profile_image_use_case.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.useCase, this.uploadImageUseCase, this.submitDataUseCase)
    : super(ProfileInitial());

  final ProfileUseCase useCase;
  final UploadProfileImageUseCase uploadImageUseCase;
  final SubmitDataUseCase submitDataUseCase;
  ProfileEntity? _profileData;

  ProfileEntity? get profileData => _profileData;

  XFile? _image;

  XFile? get image => _image;

  void intent(Intent intent) async {
    switch (intent) {
      case GetUserData():
        await getUserData();
      case PickProfileImage():
        await pickProfileImage(ImageSource.gallery);
      case CaptureProfileImage():
        await pickProfileImage(ImageSource.camera);
      case UploadProfileImage():
        await uploadProfileImage();
      case SubmitData():
    }
  }

  Future<void> getUserData() async {
    emit(ProfileLoading());

    final result = await useCase.invoke();

    if (isClosed) return;

    switch (result) {
      case Success():
        _profileData = result.data;
        emit(ProfileSuccess(result.data));

      case Error():
        emit(ProfileError(result.error));
    }
  }

Future<void> pickProfileImage(ImageSource source) async {
  try {
    final picker = ImagePicker();

    final pickedImage = await picker.pickImage(
      source: source,
      imageQuality: 85,
    );

    if (isClosed || pickedImage == null) return;

    _image = pickedImage;

    // Refresh the UI without losing the profile data.
    if (_profileData != null) {
      emit(ProfileSuccess(_profileData!));
    }
  } catch (e) {
    if (isClosed) return;
    emit(ImageError(message: e.toString()));
  }
}

  Future<void> uploadProfileImage() async {
    if (_image == null) {
      return;
    }

    emit(ImageLoading());

    final result = await uploadImageUseCase.invoke(File(_image!.path));

    if (isClosed) return;

    switch (result) {
      case Success():
        emit(ImageSuccess());
        await getUserData();
      case Error():
        emit(ImageError(message: result.error));
    }
  }

  Future<void> submitData(ProfileEntity data) async {
    emit(ProfileLoading());
    final res = await submitDataUseCase.invoke(data);

    switch (res) {
      case Success():
        emit(ProfileSuccess(res.data));
      case Error():
        emit(ProfileError(res.error));
    }
  }
}

sealed class Intent {}

class GetUserData extends Intent {}

class SubmitData extends Intent {}

class PickProfileImage extends Intent {}

class CaptureProfileImage extends Intent {}

class UploadProfileImage extends Intent {}
