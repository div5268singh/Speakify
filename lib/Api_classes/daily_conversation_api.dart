import 'dart:convert';

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
  String? headText;
  String? bodyText;
  Datum({
    this.id,
    this.headText,
    this.bodyText,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        headText: json["head_text"],
        bodyText: json["body_text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "head_text": headText,
        "body_text": bodyText,
      };
}
