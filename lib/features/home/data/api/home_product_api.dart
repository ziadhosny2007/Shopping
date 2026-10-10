import 'package:injectable/injectable.dart';
import 'package:shopping/core/constants/api_constants.dart';
import 'package:shopping/core/di/app_keys.dart';
import 'package:shopping/core/helper/app_secure_storage.dart';
import 'package:shopping/features/home/data/api/home_product_api_interface.dart';
import 'package:shopping/features/home/data/models/categories_model/categories_response_dto.dart';
import 'package:shopping/features/home/domain/entities/categories_response_entity.dart';
import 'package:shopping/features/home/domain/entities/item_entity.dart';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/home/data/models/products_model/item_dto.dart';

@Injectable(as: HomeProductApiInterface)
class HomeProductApi implements HomeProductApiInterface {
  final AppSecureStorage _storage;
  HomeProductApi(this._storage);

  @override
  Future<Result<List<ItemEntity>>> getAllProducts({
    int skip = 0,
    int limit = 20,
  }) async {
    try {
      final url = Uri.parse(
        "${ApiConstants.baseUrl}/home/products?skip=$skip&limit=$limit",
      );
      final token = await _storage.read(AppKeys.token);
      final response = await http.get(
        url,
        headers: {"Authorization": "Bearer $token"},
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final json = jsonDecode(response.body);

        final products = (json['list'] as List)
            .map((item) => ItemDto.fromJson(item).toEntity())
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

  @override
  Future<Result<List<CategoriesItemResponseEntity>>> getAllCategories() async {
    try {
      final url = Uri.parse(
        "${ApiConstants.baseUrl}${ApiConstants.getAllCategories}",
      );
      final token = await _storage.read(AppKeys.token);
      final response = await http.get(
        url,
        headers: {"Authorization": "Bearer $token"},
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final json = jsonDecode(response.body);
        if (json["list"] != null) {
          List list = json["list"];
          final categorieslist = list
              .map((e) => CategoriesItemResponseDto.fromJson(e).toEntity())
              .toList();
          return Success(categorieslist);
        } else {
          return Error("Error From Server");
        }
      }

      return Error("Error From Server");
    } on SocketException {
      return Error("Error in internet. Try again....");
    } catch (e) {
      return Error("Error $e");
    }
  }
}
