// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchProductsModel _$SearchProductsModelFromJson(Map<String, dynamic> json) =>
    SearchProductsModel(
      (json['products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total'] as int,
      json['skip'] as int,
      json['limit'] as int,
    );

Map<String, dynamic> _$SearchProductsModelToJson(
        SearchProductsModel instance) =>
    <String, dynamic>{
      'products': instance.products,
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
    };
