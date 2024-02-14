// To parse this JSON data, do
//
//     final sosResponse = sosResponseFromJson(jsonString);

import 'dart:convert';

SosResponse sosResponseFromJson(String str) =>
    SosResponse.fromJson(json.decode(str));

String sosResponseToJson(SosResponse data) => json.encode(data.toJson());

class SosResponse {
  String? message;
  int? status;
  SOSData data;

  SosResponse({
    this.message,
    this.status,
    required this.data,
  });

  factory SosResponse.fromJson(Map<String, dynamic> json) => SosResponse(
        message: json["message"],
        status: json["status"],
        data: SOSData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data?.toJson(),
      };
}

class SOSData {
  int? userId;
  String? latitude;
  String? longitude;
  DateTime? createdAt;
  int? id;

  SOSData({
    this.userId,
    this.latitude,
    this.longitude,
    this.createdAt,
    this.id,
  });

  factory SOSData.fromJson(Map<String, dynamic> json) => SOSData(
        userId: json["user_id"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "latitude": latitude,
        "longitude": longitude,
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
