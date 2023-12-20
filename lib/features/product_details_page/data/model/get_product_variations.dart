import 'package:slash_internship_assignment/features/product_details_page/data/model/variation_data_model.dart';

class GetProductVariations {
  VariationData? data;
  String? message;
  int? statusCode;

  GetProductVariations({
    this.data,
    this.message,
    this.statusCode,
  });

  factory GetProductVariations.fromJson(Map<String, dynamic> json) =>
      GetProductVariations(
        data:
            json["data"] == null ? null : VariationData.fromJson(json["data"]),
        message: json["message"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "message": message,
        "statusCode": statusCode,
      };
}





