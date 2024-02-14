// To parse this JSON data, do
//
//     final addInterestedInResponse = addInterestedInResponseFromJson(jsonString);

import 'dart:convert';

AddInterestedInResponse addInterestedInResponseFromJson(String str) =>
    AddInterestedInResponse.fromJson(json.decode(str));

String addInterestedInResponseToJson(AddInterestedInResponse data) =>
    json.encode(data.toJson());

class AddInterestedInResponse {
  String? message;
  int? status;
  AddInterestedInData data;

  AddInterestedInResponse({
    this.message,
    this.status,
    required this.data,
  });

  factory AddInterestedInResponse.fromJson(Map<String, dynamic> json) =>
      AddInterestedInResponse(
        message: json["message"],
        status: json["status"],
        data: AddInterestedInData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data?.toJson(),
      };
}

class AddInterestedInData {
  int? id;
  String? userId;
  String? interestedId;
  String? status;
  DateTime? createdAt;
  dynamic deletedAt;

  AddInterestedInData({
    this.id,
    this.userId,
    this.interestedId,
    this.status,
    this.createdAt,
    this.deletedAt,
  });

  factory AddInterestedInData.fromJson(Map<String, dynamic> json) =>
      AddInterestedInData(
        id: json["id"],
        userId: json["user_id"],
        interestedId: json["interested_id"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "interested_id": interestedId,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
