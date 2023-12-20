import 'package:slash_internship_assignment/features/products_page/data/model/pagenation_model.dart';
import 'package:slash_internship_assignment/features/products_page/data/model/product_model.dart';

class GetProductsModel {
  int? statusCode;
  String? message;
  Pagination? pagination;
  List<Product>? products;

  GetProductsModel({
    this.statusCode,
    this.message,
    this.pagination,
    this.products,
  });

  factory GetProductsModel.fromJson(Map<String, dynamic> json) =>
      GetProductsModel(
        statusCode: json["statusCode"],
        message: json["message"],
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
        products: json["data"] == null
            ? []
            : List<Product>.from(json["data"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "pagination": pagination?.toJson(),
        "data": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}
