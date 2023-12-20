import 'dart:developer';

import 'package:slash_internship_assignment/core/failure/exception.dart';
import 'package:slash_internship_assignment/core/network/network_info.dart';
import 'package:slash_internship_assignment/features/product_details_page/data/model/get_product_variations.dart';

import '../../../../core/api_provider/api_provider.dart';
import '../../../../core/api_provider/utils.dart';
import 'package:dio/dio.dart';

class GetProductVariationsRemoteDataSourceImpl {
  final Dio client = Dio();
  Future<GetProductVariations> getProductVariations(int productId) =>
      _getProductVariationsFromUrl(productId);
  Future<GetProductVariations> _getProductVariationsFromUrl(
      int productId) async {
    if (await NetworkInfoImpl().isConnected) {
      final response = await client.get(
          '${Utils.baseURL}${Utils.getProducts}/$productId',
          options: Options(headers: ApiProvider.requestHeader));
      if (response.statusCode == 200) {
        log('success');
        GetProductVariations productVariationsModels =
            GetProductVariations.fromJson(response.data);
        return productVariationsModels;
      } else {
        log('error');

        throw ServerException();
      }
    } else {
      log('fail internet');

      throw ServerException();
    }
  }
}
