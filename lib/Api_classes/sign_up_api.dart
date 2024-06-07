// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  String? status;
  String? msg;
  UserData userData;
  Post({
    this.status,
    this.msg,
    required this.userData,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        status: json["status"],
        msg: json["msg"],
        userData: UserData.fromJson(json["user_data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "user_data": userData.toJson(),
      };
}

class UserData {
  String? id;
  String? name;
  String? email;
  String? mobile;
  int? loginType;
  String? gender;
  String? fcmId;
  UserData({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.loginType,
    this.gender,
    this.fcmId,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        loginType: json["login_type"],
        gender: json["gender"],
        fcmId: json["fcm_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile": mobile,
        "login_type": loginType,
        "gender": gender,
        "fcm_id": fcmId,
      };
}
