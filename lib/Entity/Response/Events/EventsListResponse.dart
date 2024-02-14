// To parse this JSON data, do
//
//     final eventsListResponse = eventsListResponseFromJson(jsonString);

import 'dart:convert';

EventsListResponse eventsListResponseFromJson(String str) =>
    EventsListResponse.fromJson(json.decode(str));

String eventsListResponseToJson(EventsListResponse data) =>
    json.encode(data.toJson());

class EventsListResponse {
  String? message;
  int? status;
  List<EventListData> data;

  EventsListResponse({
    this.message,
    this.status,
    required this.data,
  });

  factory EventsListResponse.fromJson(Map<String, dynamic> json) =>
      EventsListResponse(
        message: json["message"],
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<EventListData>.from(
                json["data"]!.map((x) => EventListData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class EventListData {
  int? id;
  String? userId;
  String? name;
  String? description;
  String? latitude;
  String? longitude;
  String? address;
  DateTime? startDate;
  DateTime? endDate;
  String? startTime;
  String? endTime;
  String? status;
  DateTime? createdAt;
  dynamic deletedAt;
  String? image;
  List<Media>? media;

  EventListData({
    this.id,
    this.userId,
    this.name,
    this.description,
    this.latitude,
    this.longitude,
    this.address,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.status,
    this.createdAt,
    this.deletedAt,
    this.image,
    this.media,
  });

  factory EventListData.fromJson(Map<String, dynamic> json) => EventListData(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        description: json["description"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        address: json["address"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        startTime: json["start_time"],
        endTime: json["end_time"],
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
        "user_id": userId,
        "name": name,
        "description": description,
        "latitude": latitude,
        "longitude": longitude,
        "address": address,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "start_time": startTime,
        "end_time": endTime,
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
