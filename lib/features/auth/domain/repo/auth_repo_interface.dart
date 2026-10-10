import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/auth/domain/entities/auth_login_requst_entity.dart';
import 'package:shopping/features/auth/domain/entities/auth_register_entity.dart';
import 'package:shopping/features/auth/domain/entities/login_response_entity.dart';

abstract interface class AuthRepoInterface {
  Future<Result<String>> register(AuthRegisterEntity auth);
    Future<Result<LoginResponseEntity>> login(AuthLoginRequstEntity auth);

}
