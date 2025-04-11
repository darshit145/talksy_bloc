// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

LoginModel userFromJson(String str) => LoginModel.fromJson(json.decode(str));

String userToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  NewUser newUser;

  LoginModel({
    required this.newUser,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    newUser: NewUser.fromJson(json["newUser"]),
  );

  Map<String, dynamic> toJson() => {
    "newUser": newUser.toJson(),
  };
}

class NewUser {
  String uEmail;
  String uName;
  String uPhoto;
  String uMessaging;
  int uActivestatus;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  NewUser({
    required this.uEmail,
    required this.uName,
    required this.uPhoto,
    required this.uMessaging,
    required this.uActivestatus,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory NewUser.fromJson(Map<String, dynamic> json) => NewUser(
    uEmail: json["u_email"],
    uName: json["u_name"],
    uPhoto: json["u_photo"],
    uMessaging: json["u_messaging"],
    uActivestatus: json["u_activestatus"],
    id: json["_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "u_email": uEmail,
    "u_name": uName,
    "u_photo": uPhoto,
    "u_messaging": uMessaging,
    "u_activestatus": uActivestatus,
    "_id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
