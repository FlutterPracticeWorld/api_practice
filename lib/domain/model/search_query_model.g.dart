// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_query_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchQueryModel _$SearchQueryModelFromJson(Map<String, dynamic> json) =>
    SearchQueryModel(
      keyword: json['q'] as String,
    );

Map<String, dynamic> _$SearchQueryModelToJson(SearchQueryModel instance) =>
    <String, dynamic>{
      'q': instance.keyword,
    };
