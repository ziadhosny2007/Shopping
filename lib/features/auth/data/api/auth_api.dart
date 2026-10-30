import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:shopping/core/constants/api_constants.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/auth/data/models/auth_login_request_dto.dart';
import 'package:shopping/features/auth/data/models/auth_login_response_dto.dart';
import 'package:shopping/features/auth/data/models/auth_register_dto.dart';

@injectable
class AuthApi {
  Future<Result<String>> register(AuthRegisterDto auth) async {
    try {
      var url = Uri.parse("${ApiConstants.baseUrl}${ApiConstants.register}");
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(auth.toJson()),
      );
   

      if (response.statusCode >= 200 && response.statusCode < 300) {
        var json = jsonDecode(response.body);

        return Success(json["message"]);
      } else {
        return Error("Error From Server...");
      }
    } on SocketException {
      return Error("Please sure you are connect with internet...");
    } catch (e) {
      return Error("Error from catch $e");
    }
  }

  Future<Result<LoginResponseDto>> login(AuthLoginRequestDto auth) async {
    try {
      var url = Uri.parse("${ApiConstants.baseUrl}${ApiConstants.login}");
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(auth.toJson()),
      );


      if (response.statusCode >= 200 && response.statusCode < 300) {
        var json = jsonDecode(response.body);
        return Success(LoginResponseDto.fromJson(json));
      } else {
        return Error("Error From Server...");
      }
    } on SocketException {
      return Error("Please sure you are connect with internet...");
    } catch (e) {
      return Error("Error from catch $e");
    }
  }
}
