// To parse this JSON data, do
//
//     final listUser = listUserFromJson(jsonString);

import 'dart:convert';

ListUser listUserFromJson(String str) => ListUser.fromJson(json.decode(str));

String listUserToJson(ListUser data) => json.encode(data.toJson());

class ListUser {
  int totalUsers;
  int currentPage;
  int totalPages;
  List<User> users;

  ListUser({
    required this.totalUsers,
    required this.currentPage,
    required this.totalPages,
    required this.users,
  });

  factory ListUser.fromJson(Map<String, dynamic> json) => ListUser(
    totalUsers: json["totalUsers"],
    currentPage: json["currentPage"],
    totalPages: json["totalPages"],
    users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "totalUsers": totalUsers,
    "currentPage": currentPage,
    "totalPages": totalPages,
    "users": List<dynamic>.from(users.map((x) => x.toJson())),
  };
}

class User {
  String id;
  String uEmail;
  String uName;
  String uPhoto;
  String uMessaging;
  int uActivestatus;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String? uDateOfBirth;
  String? uBio;
  String? uLastactive;
  String? uLocation;
  String? uMobileno;

  User({
    required this.id,
    required this.uEmail,
    required this.uName,
    required this.uPhoto,
    required this.uMessaging,
    required this.uActivestatus,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.uDateOfBirth,
    this.uBio,
    this.uLastactive,
    this.uLocation,
    this.uMobileno,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    uEmail: json["u_email"],
    uName: json["u_name"],
    uPhoto: json["u_photo"],
    uMessaging: json["u_messaging"],
    uActivestatus: json["u_activestatus"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    uDateOfBirth: json["U_date_ofBirth"],
    uBio: json["u_bio"],
    uLastactive: json["u_lastactive"],
    uLocation: json["u_location"],
    uMobileno: json["u_mobileno"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "u_email": uEmail,
    "u_name": uName,
    "u_photo": uPhoto,
    "u_messaging": uMessaging,
    "u_activestatus": uActivestatus,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "U_date_ofBirth": uDateOfBirth,
    "u_bio": uBio,
    "u_lastactive": uLastactive,
    "u_location": uLocation,
    "u_mobileno": uMobileno,
  };
}
