import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/auth/domain/entities/auth_register_entity.dart';
import 'package:shopping/features/auth/domain/use_case/auth_register_use_case.dart';

part 'register_state.dart';
@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._register) : super(RegisterInitial());
  final AuthRegisterUseCase _register;

  Future<void> intent(Intent intent) async {
    switch (intent) {
      case RegisterWithEmaiAndPassword():
        await register(intent._auth);
    }
  }

  Future<void> register(AuthRegisterEntity auth) async {
    emit(RegisterLoading());
    final res = await _register.invoke(auth);

    switch (res) {
      case Success():
        emit(RegisterSuccess(res.data));
      case Error():
        emit(RegisterError(res.error));
    }
  }
}

sealed class Intent {}

class RegisterWithEmaiAndPassword extends Intent {
  final AuthRegisterEntity _auth;
  RegisterWithEmaiAndPassword(this._auth);
}
