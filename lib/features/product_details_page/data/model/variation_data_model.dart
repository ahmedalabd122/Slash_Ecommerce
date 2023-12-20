
import 'package:slash_internship_assignment/features/product_details_page/data/model/availble_properties_model.dart';
import 'package:slash_internship_assignment/features/product_details_page/data/model/subCategory_model.dart';
import 'package:slash_internship_assignment/features/product_details_page/data/model/variation_model.dart';

class VariationData {
  int? id;
  String? name;
  String? description;
  int? brandId;
  int? bostaSizeId;
  int? productRating;
  int? estimatedDaysPreparing;
  dynamic sizeChart;
  SubCategory? subCategory;
  List<Variation>? variations;
  List<AvaiableProperty>? avaiableProperties;
  String? brandName;
  String? brandImage;

  VariationData({
    this.id,
    this.name,
    this.description,
    this.brandId,
    this.bostaSizeId,
    this.productRating,
    this.estimatedDaysPreparing,
    this.sizeChart,
    this.subCategory,
    this.variations,
    this.avaiableProperties,
    this.brandName,
    this.brandImage,
  });

  factory VariationData.fromJson(Map<String, dynamic> json) => VariationData(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        brandId: json["brand_id"],
        bostaSizeId: json["bosta_size_id"],
        productRating: json["product_rating"],
        estimatedDaysPreparing: json["estimated_days_preparing"],
        sizeChart: json["SizeChart"],
        subCategory: json["subCategory"] == null
            ? null
            : SubCategory.fromJson(json["subCategory"]),
        variations: json["variations"] == null
            ? []
            : List<Variation>.from(
                json["variations"]!.map((x) => Variation.fromJson(x))),
        avaiableProperties: json["avaiableProperties"] == null
            ? []
            : List<AvaiableProperty>.from(json["avaiableProperties"]!
                .map((x) => AvaiableProperty.fromJson(x))),
        brandName: json["brandName"],
        brandImage: json["brandImage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "brand_id": brandId,
        "bosta_size_id": bostaSizeId,
        "product_rating": productRating,
        "estimated_days_preparing": estimatedDaysPreparing,
        "SizeChart": sizeChart,
        "subCategory": subCategory?.toJson(),
        "variations": variations == null
            ? []
            : List<dynamic>.from(variations!.map((x) => x.toJson())),
        "avaiableProperties": avaiableProperties == null
            ? []
            : List<dynamic>.from(avaiableProperties!.map((x) => x.toJson())),
        "brandName": brandName,
        "brandImage": brandImage,
      };
}
