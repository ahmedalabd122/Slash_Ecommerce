class ProductPropertiesValue {
  String? value;
  String? property;

  ProductPropertiesValue({
    this.value,
    this.property,
  });

  factory ProductPropertiesValue.fromJson(Map<String, dynamic> json) =>
      ProductPropertiesValue(
        value: json["value"],
        property: json["property"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "property": property,
      };

  
}
