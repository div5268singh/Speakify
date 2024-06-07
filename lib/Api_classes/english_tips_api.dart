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
  String? simpleText;
  String? engPara;

  Datum({
    this.id,
    this.simpleText,
    this.engPara,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        simpleText: json["simple_text"],
        engPara: json["eng_para"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "simple_text": simpleText,
        "eng_para": engPara,
      };
}
