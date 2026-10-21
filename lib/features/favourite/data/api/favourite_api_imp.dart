import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:shopping/core/constants/api_constants.dart';
import 'package:shopping/core/di/app_keys.dart';
import 'package:shopping/core/helper/app_secure_storage.dart';
import 'package:shopping/core/model/item/product_item_dto.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/favourite/data/api/favourite_api_interface.dart';

@Injectable(as: FavouriteApiInterface)
class FavouriteApiImp implements FavouriteApiInterface {
  final AppSecureStorage _storage;
  FavouriteApiImp(this._storage);
  @override
  Future<Result<String>> addToFavourite(String id) async {
    try {
      final token = await _storage.read(AppKeys.token);

      final url = Uri.parse(
        '${ApiConstants.baseUrl}${ApiConstants.addToFavorite}',
      );

      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({'productId': id}),
      );

      final responseBody = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Success(responseBody['message']?.toString() ?? 'Success');
      } else {
        return Error(
          responseBody['message']?.toString() ??
              responseBody['error']?.toString() ??
              'Server error: ${response.statusCode}',
        );
      }
    } on SocketException {
      return Error("Please sure you are connect with internet...");
    } catch (e) {
      return Error("Error from catch $e");
    }
  }

  @override
  Future<Result<String>> deleteFromFavourite(String id) async {
    try {
      final token = await _storage.read(AppKeys.token);

      final url = Uri.parse(
        '${ApiConstants.baseUrl}${ApiConstants.removeFavorite}',
      );

      final response = await http.delete(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({'productId': id}),
      );

      final responseBody = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Success(responseBody['message']?.toString() ?? 'Success');
      } else {
        return Error(
          responseBody['message']?.toString() ??
              responseBody['error']?.toString() ??
              'Server error: ${response.statusCode}',
        );
      }
    } on SocketException {
      return Error("Please sure you are connect with internet...");
    } catch (e) {
      return Error("Error from catch $e");
    }
  }

  @override
  Future<Result<List<ProductItemDto>>> getProductFromFavourite() async {
    try {
      final url = Uri.parse(
        "${ApiConstants.baseUrl}${ApiConstants.getFavorite}",
      );
      final token = await _storage.read(AppKeys.token);
      final response = await http.get(
        url,
        headers: {"Authorization": "Bearer $token"},
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final json = jsonDecode(response.body);

        final products = (json['list'] as List)
            .map((item) => ProductItemDto.fromJson(item))
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
