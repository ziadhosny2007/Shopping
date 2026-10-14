import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:shopping/core/constants/api_constants.dart';
import 'package:shopping/core/di/app_keys.dart';
import 'package:shopping/core/helper/app_secure_storage.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/product_details/data/api/product_details_api_interface.dart';
import 'package:shopping/features/product_details/data/models/product_details_dtao.dart';

@Injectable(as: ProductDetailsApiInterface)
class ProductDetailsApiImp implements ProductDetailsApiInterface {
  final AppSecureStorage _storage;
  ProductDetailsApiImp(this._storage);
  @override
  Future<Result<ProductDetailsDto>> getProductDetails(int id) async {
    try {
      final url = Uri.parse("${ApiConstants.baseUrl}/home/products/$id");
      final token = await _storage.read(AppKeys.token);
      final response = await http.get(
        url,
        headers: {"Authorization": "Bearer $token"},
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final json = jsonDecode(response.body);

        final product = ProductDetailsDto.fromJson(json);

        return Success(product);
      }

      return Error("Error From Server");
    } on SocketException {
      return Error("Error in internet. Try again....");
    } catch (e) {
      return Error("Error $e");
    }
  }
}
