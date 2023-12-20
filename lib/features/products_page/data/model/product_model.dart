import 'package:slash_internship_assignment/features/products_page/data/model/brand_model.dart';
import 'package:slash_internship_assignment/features/products_page/data/model/product_variation.dart';
import 'package:slash_internship_assignment/features/products_page/data/model/subclass_model.dart';

class Product {
  int? id;
  String? name;
  String? description;
  int? subCategoryId;
  int? brandId;
  int? bostaSizeId;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  int? productRating;
  int? estimatedDaysPreparing;
  Brands? brands;
  List<ProductVariation>? productVariations;
  SubCategories? subCategories;
  dynamic sizeChart;

  Product({
    this.id,
    this.name,
    this.description,
    this.subCategoryId,
    this.brandId,
    this.bostaSizeId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.productRating,
    this.estimatedDaysPreparing,
    this.brands,
    this.productVariations,
    this.subCategories,
    this.sizeChart,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        subCategoryId: json["sub_category_id"],
        brandId: json["brand_id"],
        bostaSizeId: json["bosta_size_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        productRating: json["product_rating"],
        estimatedDaysPreparing: json["estimated_days_preparing"],
        brands: json["Brands"] == null ? null : Brands.fromJson(json["Brands"]),
        productVariations: json["ProductVariations"] == null
            ? []
            : List<ProductVariation>.from(json["ProductVariations"]!
                .map((x) => ProductVariation.fromJson(x))),
        subCategories: json["SubCategories"] == null
            ? null
            : SubCategories.fromJson(json["SubCategories"]),
        sizeChart: json["SizeChart"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "sub_category_id": subCategoryId,
        "brand_id": brandId,
        "bosta_size_id": bostaSizeId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "deletedAt": deletedAt,
        "product_rating": productRating,
        "estimated_days_preparing": estimatedDaysPreparing,
        "Brands": brands?.toJson(),
        "ProductVariations": productVariations == null
            ? []
            : List<dynamic>.from(productVariations!.map((x) => x.toJson())),
        "SubCategories": subCategories?.toJson(),
        "SizeChart": sizeChart,
      };
}
