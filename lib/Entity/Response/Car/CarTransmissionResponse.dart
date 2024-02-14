// To parse this JSON data, do
//
//     final carTransmissionResponse = carTransmissionResponseFromJson(jsonString);

import 'dart:convert';

CarTransmissionResponse carTransmissionResponseFromJson(String str) =>
    CarTransmissionResponse.fromJson(json.decode(str));

String carTransmissionResponseToJson(CarTransmissionResponse data) =>
    json.encode(data.toJson());

class CarTransmissionResponse {
  String? message;
  int? status;
  List<TransmissionData> data;

  CarTransmissionResponse({
    this.message,
    this.status,
    required this.data,
  });

  factory CarTransmissionResponse.fromJson(Map<String, dynamic> json) =>
      CarTransmissionResponse(
        message: json["message"],
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<TransmissionData>.from(
                json["data"]!.map((x) => TransmissionData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class TransmissionData {
  int? id;
  String? name;
  String? status;
  DateTime? createdAt;
  dynamic deletedAt;

  TransmissionData({
    this.id,
    this.name,
    this.status,
    this.createdAt,
    this.deletedAt,
  });

  factory TransmissionData.fromJson(Map<String, dynamic> json) =>
      TransmissionData(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
