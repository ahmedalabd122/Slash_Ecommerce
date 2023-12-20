
class SubCategories {
  int? id;
  String? name;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? categoryId;
  String? imagePath;

  SubCategories({
    this.id,
    this.name,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.categoryId,
    this.imagePath,
  });

  factory SubCategories.fromJson(Map<String, dynamic> json) => SubCategories(
        id: json["id"],
        name: json["name"],
        deletedAt: json["deletedAt"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        categoryId: json["category_id"],
        imagePath: json["image_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "deletedAt": deletedAt,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "category_id": categoryId,
        "image_path": imagePath,
      };
}
