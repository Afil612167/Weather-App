// To parse this JSON data, do
//
//     final ipModel = ipModelFromJson(jsonString);

import 'dart:convert';

IpModel ipModelFromJson(String str) => IpModel.fromJson(json.decode(str));

String ipModelToJson(IpModel data) => json.encode(data.toJson());

class IpModel {
  IpModel({
     this.ip,
  });

  String? ip;

  factory IpModel.fromJson(Map<String, dynamic> json) => IpModel(
        ip: json["ip"],
      );

  Map<String, dynamic> toJson() => {
        "ip": ip,
      };

}

