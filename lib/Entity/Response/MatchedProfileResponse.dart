// To parse this JSON data, do
//
//     final matchedProfileResponse = matchedProfileResponseFromJson(jsonString);

import 'dart:convert';

MatchedProfileResponse matchedProfileResponseFromJson(String str) =>
    MatchedProfileResponse.fromJson(json.decode(str));

String matchedProfileResponseToJson(MatchedProfileResponse data) =>
    json.encode(data.toJson());

class MatchedProfileResponse {
  String? message;
  int? status;
  List<MatchedProfileData> data;

  MatchedProfileResponse({
    this.message,
    this.status,
    required this.data,
  });

  factory MatchedProfileResponse.fromJson(Map<String, dynamic> json) =>
      MatchedProfileResponse(
        message: json["message"],
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<MatchedProfileData>.from(
                json["data"]!.map((x) => MatchedProfileData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class MatchedProfileData {
  int id;
  String name;
  int totalFollowers;
  String profileImageUrl;

  MatchedProfileData({
    required this.id,
    required this.name,
    required this.totalFollowers,
    required this.profileImageUrl,
  });

  factory MatchedProfileData.fromJson(Map<String, dynamic> json) =>
      MatchedProfileData(
        id: json["id"],
        name: json["name"],
        totalFollowers: json["total_followers"],
        profileImageUrl: json["profile_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "total_followers": totalFollowers,
        "profile_image_url": profileImageUrl,
      };
}
