
class Value {
  String? value;
  int? id;

  Value({
    this.value,
    this.id,
  });

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        value: json["value"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "id": id,
      };
}