// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  String? message;
  int? status;
  LoginData data;

  LoginResponse({
    this.message,
    this.status,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json["message"],
        status: json["status"],
        data: LoginData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data?.toJson(),
      };
}

class LoginData {
  int? id;
  String? userType;
  String? status;
  String? email;
  dynamic countryCode;
  dynamic mobile;
  dynamic latitude;
  dynamic longitude;
  dynamic address;
  String? googleId;
  dynamic facebookId;
  String accessToken;
  int? pushNotification;
  int? notifyMonthlyPayment;
  int? accountDetails;
  String? profileImageUrl;
  String? documentImageUrl;
  String? name;

  LoginData({
    this.id,
    this.userType,
    this.status,
    this.email,
    this.countryCode,
    this.mobile,
    this.latitude,
    this.longitude,
    this.address,
    this.googleId,
    this.facebookId,
    required this.accessToken,
    this.pushNotification,
    this.notifyMonthlyPayment,
    this.accountDetails,
    this.profileImageUrl,
    this.documentImageUrl,
    this.name,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        id: json["id"],
        userType: json["user_type"],
        status: json["status"],
        email: json["email"],
        countryCode: json["country_code"],
        mobile: json["mobile"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        address: json["address"],
        googleId: json["google_id"],
        facebookId: json["facebook_id"],
        accessToken: json["access_token"],
        pushNotification: json["push_notification"],
        notifyMonthlyPayment: json["notify_monthly_payment"],
        accountDetails: json["account_details"],
        profileImageUrl: json["profile_image_url"],
        documentImageUrl: json["document_image_url"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_type": userType,
        "status": status,
        "email": email,
        "country_code": countryCode,
        "mobile": mobile,
        "latitude": latitude,
        "longitude": longitude,
        "address": address,
        "google_id": googleId,
        "facebook_id": facebookId,
        "access_token": accessToken,
        "push_notification": pushNotification,
        "notify_monthly_payment": notifyMonthlyPayment,
        "account_details": accountDetails,
        "profile_image_url": profileImageUrl,
        "document_image_url": documentImageUrl,
        "name": name,
      };
}
