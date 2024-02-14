// // To parse this JSON data, do
// //
// //     final interestedInResponse = interestedInResponseFromJson(jsonString);
//
// import 'dart:convert';
//
// InterestedInResponse interestedInResponseFromJson(String str) =>
//     InterestedInResponse.fromJson(json.decode(str));
//
// String interestedInResponseToJson(InterestedInResponse data) =>
//     json.encode(data.toJson());
//
// class InterestedInResponse {
//   String? message;
//   int? status;
//   List<InterestedInData> data;
//
//   InterestedInResponse({
//     this.message,
//     this.status,
//     required this.data,
//   });
//
//   factory InterestedInResponse.fromJson(Map<String, dynamic> json) =>
//       InterestedInResponse(
//         message: json["message"],
//         status: json["status"],
//         data: json["data"] == null
//             ? []
//             : List<InterestedInData>.from(
//                 json["data"]!.map((x) => InterestedInData.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "message": message,
//         "status": status,
//         "data": List<dynamic>.from(data!.map((x) => x.toJson())),
//       };
// }
//
// class InterestedInData {
//   int? id;
//   String? name;
//   Status? status;
//   DateTime? createdAt;
//   dynamic deletedAt;
//   bool isSelected = false;
//
//   InterestedInData({
//     this.id,
//     this.name,
//     this.status,
//     this.createdAt,
//     this.deletedAt,
//   });
//
//   factory InterestedInData.fromJson(Map<String, dynamic> json) =>
//       InterestedInData(
//         id: json["id"],
//         name: json["name"],
//         status: statusValues.map[json["status"]]!,
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         deletedAt: json["deleted_at"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "status": statusValues.reverse[status],
//         "created_at": createdAt?.toIso8601String(),
//         "deleted_at": deletedAt,
//       };
// }
//
// enum Status { ACTIVE }
//
// final statusValues = EnumValues({"active": Status.ACTIVE});
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
// To parse this JSON data, do
//
//     final interestedInResponse = interestedInResponseFromJson(jsonString);

import 'dart:convert';

InterestedInResponse interestedInResponseFromJson(String str) =>
    InterestedInResponse.fromJson(json.decode(str));

String interestedInResponseToJson(InterestedInResponse data) =>
    json.encode(data.toJson());

class InterestedInResponse {
  String? message;
  int? status;
  InterestedInData data;

  InterestedInResponse({
    this.message,
    this.status,
    required this.data,
  });

  factory InterestedInResponse.fromJson(Map<String, dynamic> json) =>
      InterestedInResponse(
        message: json["message"],
        status: json["status"],
        data: InterestedInData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data?.toJson(),
      };
}

class InterestedInData {
  int? currentPage;
  List<Datum> data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  InterestedInData({
    this.currentPage,
    required this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory InterestedInData.fromJson(Map<String, dynamic> json) =>
      InterestedInData(
        currentPage: json["current_page"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links == null
            ? []
            : List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  int? id;
  String? name;
  Status? status;
  DateTime? createdAt;
  dynamic deletedAt;
  bool isSelected = false;

  Datum({
    this.id,
    this.name,
    this.status,
    this.createdAt,
    this.deletedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        status: statusValues.map[json["status"]]!,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": statusValues.reverse[status],
        "created_at": createdAt?.toIso8601String(),
        "deleted_at": deletedAt,
      };
}

enum Status { ACTIVE }

final statusValues = EnumValues({"active": Status.ACTIVE});

class Link {
  String? url;
  String? label;
  bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
