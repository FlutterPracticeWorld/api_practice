import 'package:json_annotation/json_annotation.dart';

part 'search_query_model.g.dart';

@JsonSerializable()
class SearchQueryModel {
  @JsonKey(name: "q")
  final String keyword;

  SearchQueryModel({required this.keyword});

  Map<String, dynamic> toJson() => _$SearchQueryModelToJson(this);

  factory SearchQueryModel.fromJson(Map<String, dynamic> json)
  => _$SearchQueryModelFromJson(json);
}