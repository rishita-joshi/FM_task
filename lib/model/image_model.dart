// To parse this JSON data, do
//
//     final imageModel = imageModelFromJson(jsonString);

import 'dart:convert';

ImageModel imageModelFromJson(String str) =>
    ImageModel.fromJson(json.decode(str));

String imageModelToJson(ImageModel data) => json.encode(data.toJson());

class ImageModel {
  String message;
  String status;

  ImageModel({
    required this.message,
    required this.status,
  });

  ImageModel copyWith({
    String? message,
    String? status,
  }) =>
      ImageModel(
        message: message ?? this.message,
        status: status ?? this.status,
      );

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
      };
}
