import 'package:injectable/injectable.dart';
import 'package:shopping/core/di/app_keys.dart';
import 'package:shopping/core/di/service_locator.dart';
import 'package:shopping/core/helper/app_secure_storage.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/auth/domain/entities/auth_login_requst_entity.dart';
import 'package:shopping/features/auth/domain/entities/auth_register_entity.dart';
import 'package:shopping/features/auth/domain/entities/login_response_entity.dart';
import 'package:shopping/features/auth/domain/repo/auth_data_source_interface.dart';
import 'package:shopping/features/auth/domain/repo/auth_repo_interface.dart';

@Injectable(as: AuthRepoInterface)
class AuthRepoImp implements AuthRepoInterface {
  final AuthDataSourceInterface _dataSource;

  AuthRepoImp(this._dataSource);
  @override
  Future<Result<String>> register(AuthRegisterEntity auth) async =>
      await _dataSource.register(auth);

  @override
  Future<Result<LoginResponseEntity>> login(AuthLoginRequstEntity auth) async {
    // ignore: no_leading_underscores_for_local_identifiers
    final _storage = serviceLocator<AppSecureStorage>();
    final res = await _dataSource.login(auth);
    switch (res) {
      case Success():
        LoginResponseEntity entity = res.data;
        _storage.write(AppKeys.token, entity.token);
        _storage.write(AppKeys.message, entity.message);

        _storage.write(AppKeys.name, entity.user.name);
        _storage.write(AppKeys.phone, entity.user.phone);
        _storage.write(AppKeys.image, entity.user.image);
        _storage.write(AppKeys.email, entity.user.email);
        _storage.write(AppKeys.role, entity.user.role);

        return Success(res.data);
      case Error():
        return Error(res.error);
    }
  }
}
