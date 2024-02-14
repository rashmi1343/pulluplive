// To parse this JSON data, do
//
//     final stepOneResponse = stepOneResponseFromJson(jsonString);

import 'dart:convert';

StepOneResponse stepOneResponseFromJson(String str) =>
    StepOneResponse.fromJson(json.decode(str));

String stepOneResponseToJson(StepOneResponse data) =>
    json.encode(data.toJson());

class StepOneResponse {
  String? message;
  int? status;
  StepOneData data;

  StepOneResponse({
    this.message,
    this.status,
    required this.data,
  });

  factory StepOneResponse.fromJson(Map<String, dynamic> json) =>
      StepOneResponse(
        message: json["message"],
        status: json["status"],
        data: StepOneData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data?.toJson(),
      };
}

class StepOneData {
  int? id;
  int? userId;
  String? name;
  String? userBio;
  String? instagramUrl;
  String? youtubeUrl;
  String? gender;
  String? interestedCar;
  String? interestedSupercar;
  String? interestedIn;
  String? status;
  DateTime? createdAt;
  dynamic deletedAt;
  String? profileOneImageUrl;
  String? profileTwoImageUrl;
  String? profileThreeImageUrl;
  String? profileFourImageUrl;
  String? profileVideoImageUrl;
  List<Media>? media;

  StepOneData({
    this.id,
    this.userId,
    this.name,
    this.userBio,
    this.instagramUrl,
    this.youtubeUrl,
    this.gender,
    this.interestedCar,
    this.interestedSupercar,
    this.interestedIn,
    this.status,
    this.createdAt,
    this.deletedAt,
    this.profileOneImageUrl,
    this.profileTwoImageUrl,
    this.profileThreeImageUrl,
    this.profileFourImageUrl,
    this.profileVideoImageUrl,
    this.media,
  });

  factory StepOneData.fromJson(Map<String, dynamic> json) => StepOneData(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        userBio: json["user_bio"],
        instagramUrl: json["instagram_url"],
        youtubeUrl: json["youtube_url"],
        gender: json["gender"],
        interestedCar: json["interested_car"],
        interestedSupercar: json["interested_supercar"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        interestedIn: json["interested_in"],
        status: json["status"],
        deletedAt: json["deleted_at"],
        profileOneImageUrl: json["profile_one_image_url"],
        profileTwoImageUrl: json["profile_two_image_url"],
        profileThreeImageUrl: json["profile_three_image_url"],
        profileFourImageUrl: json["profile_four_image_url"],
        profileVideoImageUrl: json["profile_video_image_url"],
        media: json["media"] == null
            ? []
            : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "user_bio": userBio,
        "instagram_url": instagramUrl,
        "youtube_url": youtubeUrl,
        "gender": gender,
        "interested_car": interestedCar,
        "interested_supercar": interestedSupercar,
        "created_at": createdAt?.toIso8601String(),
        "interested_in": interestedIn,
        "status": status,
        "deleted_at": deletedAt,
        "profile_one_image_url": profileOneImageUrl,
        "profile_two_image_url": profileTwoImageUrl,
        "profile_three_image_url": profileThreeImageUrl,
        "profile_four_image_url": profileFourImageUrl,
        "profile_video_image_url": profileVideoImageUrl,
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
