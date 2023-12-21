class SubCategory {
  int? id;
  String? name;

  SubCategory({
    this.id,
    this.name,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
  
}
