// To parse this JSON data, do
//
//     final subscriptionDetailResponse = subscriptionDetailResponseFromJson(jsonString);

import 'dart:convert';

SubscriptionDetailResponse subscriptionDetailResponseFromJson(String str) =>
    SubscriptionDetailResponse.fromJson(json.decode(str));

String subscriptionDetailResponseToJson(SubscriptionDetailResponse data) =>
    json.encode(data.toJson());

class SubscriptionDetailResponse {
  String? message;
  int? status;
  SubscriptionDetailData data;

  SubscriptionDetailResponse({
    this.message,
    this.status,
    required this.data,
  });

  factory SubscriptionDetailResponse.fromJson(Map<String, dynamic> json) =>
      SubscriptionDetailResponse(
        message: json["message"],
        status: json["status"],
        data: SubscriptionDetailData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data?.toJson(),
      };
}

class SubscriptionDetailData {
  int? id;
  String? name;
  String? price;
  String? duration;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? image;
  List<SubscriptionDetail>? subscriptionDetails;
  List<Media>? media;

  SubscriptionDetailData({
    this.id,
    this.name,
    this.price,
    this.duration,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.subscriptionDetails,
    this.media,
  });

  factory SubscriptionDetailData.fromJson(Map<String, dynamic> json) =>
      SubscriptionDetailData(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        duration: json["duration"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        image: json["image"],
        subscriptionDetails: json["subscription_details"] == null
            ? []
            : List<SubscriptionDetail>.from(json["subscription_details"]!
                .map((x) => SubscriptionDetail.fromJson(x))),
        media: json["media"] == null
            ? []
            : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "duration": duration,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "image": image,
        "subscription_details": subscriptionDetails == null
            ? []
            : List<dynamic>.from(subscriptionDetails!.map((x) => x.toJson())),
        "media": media == null
            ? []
            : List<dynamic>.from(media!.map((x) => x.toJson())),
      };
}

class Media {
  int? id;
  String? modelType;
  int? modelId;
  String? collectionName;
  String? name;
  String? fileName;
  String? mimeType;
  String? disk;
  int? size;
  List<dynamic>? manipulations;
  List<dynamic>? customProperties;
  List<dynamic>? responsiveImages;
  int? orderColumn;
  DateTime? createdAt;
  DateTime? updatedAt;

  Media({
    this.id,
    this.modelType,
    this.modelId,
    this.collectionName,
    this.name,
    this.fileName,
    this.mimeType,
    this.disk,
    this.size,
    this.manipulations,
    this.customProperties,
    this.responsiveImages,
    this.orderColumn,
    this.createdAt,
    this.updatedAt,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["id"],
        modelType: json["model_type"],
        modelId: json["model_id"],
        collectionName: json["collection_name"],
        name: json["name"],
        fileName: json["file_name"],
        mimeType: json["mime_type"],
        disk: json["disk"],
        size: json["size"],
        manipulations: json["manipulations"] == null
            ? []
            : List<dynamic>.from(json["manipulations"]!.map((x) => x)),
        customProperties: json["custom_properties"] == null
            ? []
            : List<dynamic>.from(json["custom_properties"]!.map((x) => x)),
        responsiveImages: json["responsive_images"] == null
            ? []
            : List<dynamic>.from(json["responsive_images"]!.map((x) => x)),
        orderColumn: json["order_column"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "model_type": modelType,
        "model_id": modelId,
        "collection_name": collectionName,
        "name": name,
        "file_name": fileName,
        "mime_type": mimeType,
        "disk": disk,
        "size": size,
        "manipulations": manipulations == null
            ? []
            : List<dynamic>.from(manipulations!.map((x) => x)),
        "custom_properties": customProperties == null
            ? []
            : List<dynamic>.from(customProperties!.map((x) => x)),
        "responsive_images": responsiveImages == null
            ? []
            : List<dynamic>.from(responsiveImages!.map((x) => x)),
        "order_column": orderColumn,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class SubscriptionDetail {
  int? id;
  int? subscriptionId;
  String? name;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  SubscriptionDetail({
    this.id,
    this.subscriptionId,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory SubscriptionDetail.fromJson(Map<String, dynamic> json) =>
      SubscriptionDetail(
        id: json["id"],
        subscriptionId: json["subscription_id"],
        name: json["name"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subscription_id": subscriptionId,
        "name": name,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
