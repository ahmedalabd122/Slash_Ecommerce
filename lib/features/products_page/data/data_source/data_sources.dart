import 'dart:developer';

import 'package:slash_internship_assignment/core/failure/exception.dart';
import 'package:slash_internship_assignment/core/network/network_info.dart';
import 'package:slash_internship_assignment/features/products_page/data/model/get_products_model.dart';

import '../../../../core/api_provider/api_provider.dart';
import '../../../../core/api_provider/utils.dart';
import 'package:dio/dio.dart';

class GetProductsRemoteDataSourceImpl {
  final Dio client = Dio();

  Future<GetProductsModel> getProducts() => _getProductsFromUrl();
  Future<GetProductsModel> _getProductsFromUrl() async {
    if (await NetworkInfoImpl().isConnected) {
      final response = await client.get('${Utils.baseURL}${Utils.getProducts}',
          options: Options(headers: ApiProvider.requestHeader));
      if (response.statusCode == 200) {
        log('success');
        GetProductsModel productListModels =
            GetProductsModel.fromJson(response.data);
        return productListModels;
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
