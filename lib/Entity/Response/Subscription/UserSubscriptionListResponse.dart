// To parse this JSON data, do
//
//     final userSubscriptionListResponse = userSubscriptionListResponseFromJson(jsonString);

import 'dart:convert';

UserSubscriptionListResponse userSubscriptionListResponseFromJson(String str) =>
    UserSubscriptionListResponse.fromJson(json.decode(str));

String userSubscriptionListResponseToJson(UserSubscriptionListResponse data) =>
    json.encode(data.toJson());

class UserSubscriptionListResponse {
  String? message;
  int? status;
  List<UserSubscriptionData> data;

  UserSubscriptionListResponse({
    this.message,
    this.status,
    required this.data,
  });

  factory UserSubscriptionListResponse.fromJson(Map<String, dynamic> json) =>
      UserSubscriptionListResponse(
        message: json["message"],
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<UserSubscriptionData>.from(
                json["data"]!.map((x) => UserSubscriptionData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class UserSubscriptionData {
  int? id;
  String? type;
  int? userId;
  int? subscriptionId;
  dynamic assignedBy;
  dynamic assignedAt;
  dynamic actionBy;
  dynamic actionAt;
  dynamic actionReason;
  dynamic actionMessage;
  DateTime? fromDate;
  DateTime? toDate;
  dynamic requestTime;
  int? rating;
  dynamic comment;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  SubsUser? user;
  Subscription? subscription;
  Transaction? transaction;

  UserSubscriptionData({
    this.id,
    this.type,
    this.userId,
    this.subscriptionId,
    this.assignedBy,
    this.assignedAt,
    this.actionBy,
    this.actionAt,
    this.actionReason,
    this.actionMessage,
    this.fromDate,
    this.toDate,
    this.requestTime,
    this.rating,
    this.comment,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.subscription,
    this.transaction,
  });

  factory UserSubscriptionData.fromJson(Map<String, dynamic> json) =>
      UserSubscriptionData(
        id: json["id"],
        type: json["type"],
        userId: json["user_id"],
        subscriptionId: json["subscription_id"],
        assignedBy: json["assigned_by"],
        assignedAt: json["assigned_at"],
        actionBy: json["action_by"],
        actionAt: json["action_at"],
        actionReason: json["action_reason"],
        actionMessage: json["action_message"],
        fromDate: json["from_date"] == null
            ? null
            : DateTime.parse(json["from_date"]),
        toDate:
            json["to_date"] == null ? null : DateTime.parse(json["to_date"]),
        requestTime: json["request_time"],
        rating: json["rating"],
        comment: json["comment"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        user: json["user"] == null ? null : SubsUser.fromJson(json["user"]),
        subscription: json["subscription"] == null
            ? null
            : Subscription.fromJson(json["subscription"]),
        transaction: json["transaction"] == null
            ? null
            : Transaction.fromJson(json["transaction"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "user_id": userId,
        "subscription_id": subscriptionId,
        "assigned_by": assignedBy,
        "assigned_at": assignedAt,
        "action_by": actionBy,
        "action_at": actionAt,
        "action_reason": actionReason,
        "action_message": actionMessage,
        "from_date":
            "${fromDate!.year.toString().padLeft(4, '0')}-${fromDate!.month.toString().padLeft(2, '0')}-${fromDate!.day.toString().padLeft(2, '0')}",
        "to_date":
            "${toDate!.year.toString().padLeft(4, '0')}-${toDate!.month.toString().padLeft(2, '0')}-${toDate!.day.toString().padLeft(2, '0')}",
        "request_time": requestTime,
        "rating": rating,
        "comment": comment,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user?.toJson(),
        "subscription": subscription?.toJson(),
        "transaction": transaction?.toJson(),
      };
}

class Subscription {
  int? id;
  String? name;
  String? price;
  String? duration;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? image;
  List<Media>? media;

  Subscription({
    this.id,
    this.name,
    this.price,
    this.duration,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.media,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
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

class Transaction {
  int? id;
  int? bookingId;
  int? userId;
  String? paymentType;
  int? amount;
  String? transactionStatus;
  DateTime? paymentDate;
  String? paymentStatus;
  DateTime? createdAt;
  DateTime? updatedAt;

  Transaction({
    this.id,
    this.bookingId,
    this.userId,
    this.paymentType,
    this.amount,
    this.transactionStatus,
    this.paymentDate,
    this.paymentStatus,
    this.createdAt,
    this.updatedAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        bookingId: json["booking_id"],
        userId: json["user_id"],
        paymentType: json["payment_type"],
        amount: json["amount"],
        transactionStatus: json["transaction_status"],
        paymentDate: json["payment_date"] == null
            ? null
            : DateTime.parse(json["payment_date"]),
        paymentStatus: json["payment_status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "booking_id": bookingId,
        "user_id": userId,
        "payment_type": paymentType,
        "amount": amount,
        "transaction_status": transactionStatus,
        "payment_date":
            "${paymentDate!.year.toString().padLeft(4, '0')}-${paymentDate!.month.toString().padLeft(2, '0')}-${paymentDate!.day.toString().padLeft(2, '0')}",
        "payment_status": paymentStatus,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class SubsUser {
  int? id;
  String? userType;
  String? status;
  String? email;
  dynamic mobile;
  String? googleId;
  dynamic facebookId;
  String? accessToken;
  String? profileImageUrl;

  SubsUser({
    this.id,
    this.userType,
    this.status,
    this.email,
    this.mobile,
    this.googleId,
    this.facebookId,
    this.accessToken,
    this.profileImageUrl,
  });

  factory SubsUser.fromJson(Map<String, dynamic> json) => SubsUser(
        id: json["id"],
        userType: json["user_type"],
        status: json["status"],
        email: json["email"],
        mobile: json["mobile"],
        googleId: json["google_id"],
        facebookId: json["facebook_id"],
        accessToken: json["access_token"],
        profileImageUrl: json["profile_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_type": userType,
        "status": status,
        "email": email,
        "mobile": mobile,
        "google_id": googleId,
        "facebook_id": facebookId,
        "access_token": accessToken,
        "profile_image_url": profileImageUrl,
      };
}
