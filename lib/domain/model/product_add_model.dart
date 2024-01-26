import 'package:json_annotation/json_annotation.dart';

part 'product_add_model.g.dart';

@JsonSerializable()
class ProductAddModel {
  final int id;
  final String title;

  ProductAddModel({
    required this.id,
    required this.title,
  });

  factory ProductAddModel.fromJson(Map<String, dynamic> json) => _$ProductAddModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductAddModelToJson(this);
}
