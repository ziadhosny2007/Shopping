import 'package:injectable/injectable.dart';
import 'package:shopping/core/network/result.dart';
import 'package:shopping/features/product_details/data/api/product_details_api_interface.dart';
import 'package:shopping/features/product_details/data/models/product_details_dtao.dart';
import 'package:shopping/features/product_details/domain/repo/product_details_data_source_interface.dart';

@Injectable(as: ProductDetailsDataSourceInterface)
class ProductDetailsDataSourceImp implements ProductDetailsDataSourceInterface {
  final ProductDetailsApiInterface _api;
  ProductDetailsDataSourceImp(this._api);
  @override
  Future<Result<ProductDetailsDto>> getProductDetails(int id) async =>
      await _api.getProductDetails(id);
}
