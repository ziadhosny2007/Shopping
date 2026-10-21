import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:shopping/core/constants/api_constants.dart';
import 'package:shopping/core/di/app_keys.dart';
import 'package:shopping/core/helper/app_secure_storage.dart';
import 'package:shopping/core/model/item/product_item_dto.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/cart/data/api/cart_api_interface.dart';

@Injectable(as: CartApiInterface)
class CartApiImp implements CartApiInterface {
  final AppSecureStorage _storage;
  CartApiImp(this._storage);
  @override
  Future<Result<String>> addToCart(String id) async {
    try {
      final token = await _storage.read(AppKeys.token);

      final url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.addCart}');

      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({'productId': int.parse(id)}),
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
  Future<Result<String>> deleteFromCart(String id) async {
    try {
      final token = await _storage.read(AppKeys.token);

      final url = Uri.parse(
        '${ApiConstants.baseUrl}${ApiConstants.deleteCart}',
      );

      final response = await http.delete(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({'productId': int.parse(id)}),
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
  Future<Result<List<ProductItemDto>>> getProductFromCart() async {
    try {
      final url = Uri.parse("${ApiConstants.baseUrl}${ApiConstants.getCart}");

      final token = await _storage.read(AppKeys.token);

      final response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
        },
      );

      // Debug
      print("Cart URL: $url");
      print("Token exists: ${token != null && token.isNotEmpty}");
      print("Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final decoded = jsonDecode(response.body);

        final List<dynamic> productsJson = decoded['list'];

        final products = productsJson
            .map(
              (item) => ProductItemDto.fromJson(item as Map<String, dynamic>),
            )
            .toList();

        return Success(products);
      }

      return Error("Server Error ${response.statusCode}: ${response.body}");
    } on SocketException {
      return Error("Internet connection error. Try again.");
    } on FormatException catch (e) {
      return Error("Invalid JSON response: $e");
    } catch (e) {
      return Error("Error: $e");
    }
  }
}
