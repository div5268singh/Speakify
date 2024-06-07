import 'dart:convert';

import 'package:flutter/material.dart';

Get getFromJson(String str) => Get.fromJson(json.decode(str));

String getToJson(Get data) => json.encode(data.toJson());

class Get {
  String? status;
  String? msg;
  List<Datum> data;

  Get({
    this.status,
    this.msg,
    required this.data,
  });

  factory Get.fromJson(Map<String, dynamic> json) => Get(
        status: json["status"],
        msg: json["msg"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String? id;
  String titleText;
  String? audioFile;
  Datum({
    this.id,
    required this.titleText,
    this.audioFile,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        titleText: json["title_text"],
        audioFile: json["audio_file"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title_text": titleText,
        "audio_file": audioFile,
      };

  static fromMap(json) {}

  static map(Text Function(dynamic Datum) param0) {}
}
