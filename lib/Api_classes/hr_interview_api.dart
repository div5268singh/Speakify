import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  String? status;
  String? msg;
  List<Datum> data;
  Post({
    this.status,
    this.msg,
    required this.data,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
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
  String? traps;
  String? bestAnswer;
  String? status;
  Datum({
    this.id,
    this.headText,
    this.traps,
    this.bestAnswer,
    this.status,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        headText: json["head_text"],
        traps: json["traps"],
        bestAnswer: json["best_answer"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "head_text": headText,
        "traps": traps,
        "best_answer": bestAnswer,
        "status": status,
      };
}
