// To parse this JSON data, do
//
//     final carListResponse = carListResponseFromJson(jsonString);

import 'dart:convert';

CarListResponse carListResponseFromJson(String str) =>
    CarListResponse.fromJson(json.decode(str));

String carListResponseToJson(CarListResponse data) =>
    json.encode(data.toJson());

class CarListResponse {
  String? message;
  int? status;
  List<CarListData> data;

  CarListResponse({
    this.message,
    this.status,
    required this.data,
  });

  factory CarListResponse.fromJson(Map<String, dynamic> json) =>
      CarListResponse(
        message: json["message"],
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<CarListData>.from(
                json["data"]!.map((x) => CarListData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CarListData {
  int id;
  String name;
  String carCategory;
  String status;
  DateTime? createdAt;
  dynamic deletedAt;
  String image;
  List<Media> media;
  bool isSelected = false;

  CarListData({
    required this.id,
    required this.name,
    required this.carCategory,
    required this.status,
    this.createdAt,
    this.deletedAt,
    required this.image,
    required this.media,
  });

  factory CarListData.fromJson(Map<String, dynamic> json) => CarListData(
        id: json["id"],
        name: json["name"],
        carCategory: json["car_category"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        deletedAt: json["deleted_at"],
        image: json["image"],
        media: json["media"] == null
            ? []
            : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "car_category": carCategory,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "image": image,
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
