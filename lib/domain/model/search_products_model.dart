import 'package:api_practice/domain/model/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_products_model.g.dart';

@JsonSerializable()
class SearchProductsModel {
  final List<ProductModel> products;
  final int total;
  final int skip;
  final int limit;

  SearchProductsModel(this.products, this.total, this.skip, this.limit);

  factory SearchProductsModel.fromJson(Map<String, dynamic> json)
  => _$SearchProductsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchProductsModelToJson(this);
}