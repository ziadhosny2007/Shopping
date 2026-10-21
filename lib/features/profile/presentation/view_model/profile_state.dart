part of 'profile_cubit.dart';

sealed class ProfileState<T> {}

class ProfileInitial<T> extends ProfileState<T> {}

class ProfileSuccess<T> extends ProfileState<T> {
   T data;

  ProfileSuccess(this.data);
}

class ProfileLoading<T> extends ProfileState<T> {}

class ProfileError<T> extends ProfileState<T> {
  final String error;

  ProfileError(this.error);
}

class ImageInitial<T> extends ProfileState<T> {}

class ImageLoading<T> extends ProfileState<T> {}

class ImageSuccess<T> extends ProfileState<T> {
  
}

class ImageError<T> extends ProfileState<T> {
  final String message;
  ImageError({required this.message});
}
