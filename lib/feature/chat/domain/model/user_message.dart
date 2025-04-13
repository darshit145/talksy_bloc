// To parse this JSON data, do
//
//     final userMessage = userMessageFromJson(jsonString);

import 'dart:convert';

UserMessage userMessageFromJson(String str) => UserMessage.fromJson(json.decode(str));

String userMessageToJson(UserMessage data) => json.encode(data.toJson());

class UserMessage {
  bool success;
  List<Message> messages;

  UserMessage({
    required this.success,
    required this.messages,
  });

  factory UserMessage.fromJson(Map<String, dynamic> json) => UserMessage(
    success: json["success"],
    messages: List<Message>.from(json["messages"].map((x) => Message.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
  };
}

class Message {
  String id;
  String msg;
  String from;
  String to;
  String dateSendingTime;
  int readStatus;
  String day;
  int v;

  Message({
    required this.id,
    required this.msg,
    required this.from,
    required this.to,
    required this.dateSendingTime,
    required this.readStatus,
    required this.day,
    required this.v,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json["_id"],
    msg: json["msg"],
    from: json["from"],
    to: json["to"],
    dateSendingTime: json["dateSendingTime"],
    readStatus: json["readStatus"],
    day: json["day"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "msg": msg,
    "from": from,
    "to": to,
    "dateSendingTime": dateSendingTime,
    "readStatus": readStatus,
    "day": day,
    "__v": v,
  };

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map={};
    map['msg']=msg;
    map['fromU']=from;
    map['toU']=to;
    map['dateSendingTime']=dateSendingTime;
    map['readStatus']=readStatus;
    map['day']=day;
    return  map;
  }
}
