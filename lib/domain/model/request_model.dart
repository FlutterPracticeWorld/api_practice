import 'package:json_annotation/json_annotation.dart';

part 'request_model.g.dart';

@JsonSerializable()
class RequestModel {
  final String title;

  RequestModel(this.title);

  Map<String, dynamic> toJson() => _$RequestModelToJson(this);

  factory RequestModel.fromJson(Map<String, dynamic> json)
  => _$RequestModelFromJson(json);
}