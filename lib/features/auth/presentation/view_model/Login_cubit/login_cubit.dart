import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/auth/domain/entities/auth_login_requst_entity.dart';
import 'package:shopping/features/auth/domain/entities/login_response_entity.dart';
import 'package:shopping/features/auth/domain/use_case/auth_login_use_case.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._auth) : super(LoginInitial());
  final AuthLoginUseCase _auth;

  Future<void> intent(Intent intent) async {
    switch (intent) {
      case LoginWithEmaiAndPassword():
        await login(intent._auth);
    }
  }

  Future<void> login(AuthLoginRequstEntity auth) async {
    emit(LoginLoading());
    final res = await _auth.invoke(auth);

    switch (res) {
      case Success():
        emit(LoginSuccess(res.data));
      case Error():
        emit(LoginError(res.error));
    }
  }
}

sealed class Intent {}

class LoginWithEmaiAndPassword extends Intent {
  final AuthLoginRequstEntity _auth;
  LoginWithEmaiAndPassword(this._auth);
}
