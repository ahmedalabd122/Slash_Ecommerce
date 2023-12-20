

import 'package:slash_internship_assignment/features/products_page/data/model/product_status_lockup.dart';
import 'package:slash_internship_assignment/features/products_page/data/model/product_variations_images.dart';

class ProductVariation {
  int? id;
  int? productId;
  int? price;
  int? quantity;
  bool? isDefault;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? productVariationStatusId;
  ProductStatusLookups? productStatusLookups;
  List<ProductVarientImage>? productVarientImages;

  ProductVariation({
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.isDefault,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.productVariationStatusId,
    this.productStatusLookups,
    this.productVarientImages,
  });

  factory ProductVariation.fromJson(Map<String, dynamic> json) =>
      ProductVariation(
        id: json["id"],
        productId: json["product_id"],
        price: json["price"],
        quantity: json["quantity"],
        isDefault: json["is_default"],
        deletedAt: json["deletedAt"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        productVariationStatusId: json["product_variation_status_id"],
        productStatusLookups: json["ProductStatusLookups"] == null
            ? null
            : ProductStatusLookups.fromJson(json["ProductStatusLookups"]),
        productVarientImages: json["ProductVarientImages"] == null
            ? []
            : List<ProductVarientImage>.from(json["ProductVarientImages"]!
                .map((x) => ProductVarientImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "price": price,
        "quantity": quantity,
        "is_default": isDefault,
        "deletedAt": deletedAt,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "product_variation_status_id": productVariationStatusId,
        "ProductStatusLookups": productStatusLookups?.toJson(),
        "ProductVarientImages": productVarientImages == null
            ? []
            : List<dynamic>.from(productVarientImages!.map((x) => x.toJson())),
      };
}
