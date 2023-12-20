class ProductStatusLookups {
  int? id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;

  ProductStatusLookups({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductStatusLookups.fromJson(Map<String, dynamic> json) =>
      ProductStatusLookups(
        id: json["id"],
        name: json["name"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
