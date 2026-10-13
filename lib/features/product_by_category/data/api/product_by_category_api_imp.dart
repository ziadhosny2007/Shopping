import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:shopping/core/constants/api_constants.dart';
import 'package:shopping/core/di/app_keys.dart';
import 'package:shopping/core/helper/app_secure_storage.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/product_by_category/data/api/product_by_category_api_interface.dart';
import 'package:shopping/features/product_by_category/data/models/product_by_category_dto.dart';

@Injectable(as: ProductByCategoryApiInterface)
class ProductByCategoryApiImp implements ProductByCategoryApiInterface {
  final AppSecureStorage _storage;
  ProductByCategoryApiImp(this._storage);
  @override
  Future<Result<ProductByCategoryDto>> getProductByCategory(
    String slug, {
    int skip = 0,
    int limit = 100,
  }) async {
    try {
      final url = Uri.parse(
        "${ApiConstants.baseUrl}${ApiConstants.getProductsByCategory}$slug?skip=$skip&limit=$limit",
      );
      final token = await _storage.read(AppKeys.token);
      final response = await http.get(
        url,
        headers: {"Authorization": "Bearer $token"},
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final json = jsonDecode(response.body);

        final products = ProductByCategoryDto.fromJson(json);

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
