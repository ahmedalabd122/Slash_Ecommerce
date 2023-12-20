class ProductVarientImage {
  int? id;
  String? imagePath;
  dynamic productVarientId;
  DateTime? createdAt;
  DateTime? updatedAt;

  ProductVarientImage({
    this.id,
    this.imagePath,
    this.productVarientId,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductVarientImage.fromJson(Map<String, dynamic> json) =>
      ProductVarientImage(
        id: json["id"],
        imagePath: json["image_path"],
        productVarientId: json["product_varient_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image_path": imagePath,
        "product_varient_id": productVarientId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
