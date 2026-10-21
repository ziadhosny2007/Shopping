import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:shopping/core/constants/api_constants.dart';
import 'package:shopping/core/di/app_keys.dart';
import 'package:shopping/core/helper/app_secure_storage.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/search/data/api/search_api_interface.dart';
import 'package:shopping/features/search/data/models/search_dto.dart';

@Injectable(as: SearchApiInterface)
class SearchApiImp implements SearchApiInterface {
  final AppSecureStorage _storage;
  SearchApiImp(this._storage);
  @override
  Future<Result<List<SearchItemDto>>> search(String name) async {
    int skip = 0;
    int limit = 100;
    try {
      final url = Uri.parse("${ApiConstants.baseUrl}${ApiConstants.search}");
      final token = await _storage.read(AppKeys.token);
      final response = await http.post(
        url,
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode({"search": name, "skip": skip, "limit": limit}),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final json = jsonDecode(response.body);

        final products = (json['list'] as List)
            .map((item) => SearchItemDto.fromJson(item))
            .toList();

        return Success(products);
      }

      return Error("Error From Server");
    } on SocketException {
      return Error("Error in internet. Try again....");
    } catch (e) {
      return Error("Error $e");
    }
  }
}
