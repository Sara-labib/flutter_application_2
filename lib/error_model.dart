import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel {
  String? field;
  String? message;

  ErrorModel(this.field, this.message);

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);
  Map<String, dynamic> ToJson() => _$ErrorModelToJson(json);
}
