import 'package:injectable/injectable.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/auth/data/api/auth_api.dart';
import 'package:shopping/features/auth/data/models/auth_login_request_dto.dart';
import 'package:shopping/features/auth/data/models/auth_register_dto.dart';
import 'package:shopping/features/auth/domain/entities/auth_login_requst_entity.dart';
import 'package:shopping/features/auth/domain/entities/auth_register_entity.dart';
import 'package:shopping/features/auth/domain/entities/login_response_entity.dart';
import 'package:shopping/features/auth/domain/repo/auth_data_source_interface.dart';

@Injectable(as: AuthDataSourceInterface)
class AuthDataSourceImp implements AuthDataSourceInterface {
  final AuthApi _api;
  AuthDataSourceImp(this._api);

  @override
  Future<Result<String>> register(AuthRegisterEntity auth) async {
    return await _api.register(
      AuthRegisterDto(
        email: auth.email,
        password: auth.password,
        confirmPassword: auth.confirmPassword,
        name: auth.name,
        phone: auth.phone,
      ),
    );
  }

  @override
  Future<Result<LoginResponseEntity>> login(AuthLoginRequstEntity auth) async {
    var res = await _api.login(
      AuthLoginRequestDto(email: auth.email, password: auth.password),
    );
    switch (res) {
      case Success():
        return Success(res.data.toEntity());
      case Error():
        return Error(res.error);
    }
  }
}
