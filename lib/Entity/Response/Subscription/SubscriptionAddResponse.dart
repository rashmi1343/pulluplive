// To parse this JSON data, do
//
//     final subscriptionAddResponse = subscriptionAddResponseFromJson(jsonString);

import 'dart:convert';

SubscriptionAddResponse subscriptionAddResponseFromJson(String str) =>
    SubscriptionAddResponse.fromJson(json.decode(str));

String subscriptionAddResponseToJson(SubscriptionAddResponse data) =>
    json.encode(data.toJson());

class SubscriptionAddResponse {
  String? message;
  int? status;
  dynamic data;

  SubscriptionAddResponse({
    this.message,
    this.status,
    this.data,
  });

  factory SubscriptionAddResponse.fromJson(Map<String, dynamic> json) =>
      SubscriptionAddResponse(
        message: json["message"],
        status: json["status"],
        data: SubscriptionAddData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data,
      };
}

class SubscriptionAddData {
  int? userId;
  String? subscriptionId;
  DateTime? fromDate;
  DateTime? toDate;
  String? type;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  SubscriptionAddData({
    this.userId,
    this.subscriptionId,
    this.fromDate,
    this.toDate,
    this.type,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory SubscriptionAddData.fromJson(Map<String, dynamic> json) =>
      SubscriptionAddData(
        userId: json["user_id"],
        subscriptionId: json["subscription_id"],
        fromDate: json["from_date"] == null
            ? null
            : DateTime.parse(json["from_date"]),
        toDate:
            json["to_date"] == null ? null : DateTime.parse(json["to_date"]),
        type: json["type"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "subscription_id": subscriptionId,
        "from_date":
            "${fromDate!.year.toString().padLeft(4, '0')}-${fromDate!.month.toString().padLeft(2, '0')}-${fromDate!.day.toString().padLeft(2, '0')}",
        "to_date":
            "${toDate!.year.toString().padLeft(4, '0')}-${toDate!.month.toString().padLeft(2, '0')}-${toDate!.day.toString().padLeft(2, '0')}",
        "type": type,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
