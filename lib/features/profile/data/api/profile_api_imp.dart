import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:shopping/core/constants/api_constants.dart';
import 'package:shopping/core/di/app_keys.dart';
import 'package:shopping/core/helper/app_secure_storage.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/profile/data/api/profile_api_interface.dart';
import 'package:shopping/features/profile/data/models/profile_dto.dart';

@Injectable(as: ProfileApiInterface)
class ProfileApiImp implements ProfileApiInterface {
  final AppSecureStorage _storage;
  ProfileApiImp(this._storage);
  @override
  Future<Result<ProfileDto>> getUserData() async {
    try {
      final url = Uri.parse(
        "${ApiConstants.baseUrl}${ApiConstants.getUserData}",
      );
      final token = await _storage.read(AppKeys.token);
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final json = jsonDecode(response.body);

        final data = ProfileDto.fromJson(
          json['message'] as Map<String, dynamic>,
        );

        return Success(data);
      } else {
        return Error("Error From Server");
      }
    } on SocketException {
      return Error("Error in internet. Try again....");
    } catch (e) {
      return Error("Error $e");
    }
  }

  @override
  Future<Result<String>> uploadProfileImage(File image) async {
    try {
      final token = await _storage.read(AppKeys.token);

      if (token.trim().isEmpty) {
        return Error('Token not found. Please login again.');
      }

      final url = Uri.parse(
        '${ApiConstants.baseUrl}${ApiConstants.uploadImage}',
      );

      final request = http.MultipartRequest('POST', url);

      request.headers['Authorization'] = 'Bearer $token';

      request.files.add(await http.MultipartFile.fromPath('image', image.path));

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Success(response.body);
      }

      String message = 'Upload failed: ${response.statusCode}';

      try {
        final body = jsonDecode(response.body);

        if (body is Map<String, dynamic>) {
          message = body['message']?.toString() ?? message;
        }
      } catch (_) {
        if (response.body.isNotEmpty) {
          message = response.body;
        }
      }

      return Error(message);
    } on SocketException {
      return Error('No internet connection.');
    } catch (e) {
      return Error('Upload error: $e');
    }
  }

  @override
  Future<Result<String>> submitData(ProfileDto data) async {
    try {
      final url = Uri.parse(
        "${ApiConstants.baseUrl}${ApiConstants.editUserData}",
      );
      final token = await _storage.read(AppKeys.token);
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "name": data.name,
          "image": data.image,
          "address": data.address,
          "phone": data.phone,
        }),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final json = jsonDecode(response.body);

        return Success(json["message"]);
      } else {
        return Error("Error From Server");
      }
    } on SocketException {
      return Error("Error in internet. Try again....");
    } catch (e) {
      return Error("Error $e");
    }
  }
}
