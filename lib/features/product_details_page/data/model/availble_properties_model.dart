import 'package:slash_internship_assignment/features/product_details_page/data/model/poprerty_value_model.dart';

class AvaiableProperty {
  String? property;
  List<Value>? values;

  AvaiableProperty({
    this.property,
    this.values,
  });

  factory AvaiableProperty.fromJson(Map<String, dynamic> json) =>
      AvaiableProperty(
        property: json["property"],
        values: json["values"] == null
            ? []
            : List<Value>.from(json["values"]!.map((x) => Value.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "property": property,
        "values": values == null
            ? []
            : List<dynamic>.from(values!.map((x) => x.toJson())),
      };
}