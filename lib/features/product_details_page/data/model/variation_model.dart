import 'package:slash_internship_assignment/features/product_details_page/data/model/product_properties_value_model.dart';
import 'package:slash_internship_assignment/features/product_details_page/data/model/product_varition_images_model.dart';

class Variation {
  int? id;
  int? price;
  int? quantity;
  bool? inStock;
  List<ProductVarientImage>? productVarientImages;
  List<ProductPropertiesValue>? productPropertiesValues;
  String? productStatus;
  bool? isDefault;
  int? productVariationStatusId;

  Variation({
    this.id,
    this.price,
    this.quantity,
    this.inStock,
    this.productVarientImages,
    this.productPropertiesValues,
    this.productStatus,
    this.isDefault,
    this.productVariationStatusId,
  });

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
        id: json["id"],
        price: json["price"],
        quantity: json["quantity"],
        inStock: json["inStock"],
        productVarientImages: json["ProductVarientImages"] == null
            ? []
            : List<ProductVarientImage>.from(json["ProductVarientImages"]!
                .map((x) => ProductVarientImage.fromJson(x))),
        productPropertiesValues: json["productPropertiesValues"] == null
            ? []
            : List<ProductPropertiesValue>.from(json["productPropertiesValues"]!
                .map((x) => ProductPropertiesValue.fromJson(x))),
        productStatus: json["productStatus"],
        isDefault: json["isDefault"],
        productVariationStatusId: json["product_variation_status_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "quantity": quantity,
        "inStock": inStock,
        "ProductVarientImages": productVarientImages == null
            ? []
            : List<dynamic>.from(productVarientImages!.map((x) => x.toJson())),
        "productPropertiesValues": productPropertiesValues == null
            ? []
            : List<dynamic>.from(
                productPropertiesValues!.map((x) => x.toJson())),
        "productStatus": productStatus,
        "isDefault": isDefault,
        "product_variation_status_id": productVariationStatusId,
      };
}
