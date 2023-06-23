// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

class ProfileModel {
  String? fullName;
  String? username;
  String? phone;
  String? lastLogin;
  dynamic profilePic;
  int? bonusPoint;
  String? balance;
  List<FacultyAmountTrasaction>? facultyAmountTrasaction;

  ProfileModel({
    this.fullName,
    this.username,
    this.phone,
    this.lastLogin,
    this.profilePic,
    this.bonusPoint,
    this.balance,
    this.facultyAmountTrasaction,
  });

  factory ProfileModel.fromRawJson(String str) =>
      ProfileModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        fullName: json["full_name"],
        username: json["username"],
        phone: json["phone"],
        lastLogin: json["last_login"],
        profilePic: json["profile_pic"],
        bonusPoint: json["bonus_point"],
        balance: json["balance"],
        facultyAmountTrasaction: json["faculty_amount_trasaction"] == null
            ? []
            : List<FacultyAmountTrasaction>.from(
                json["faculty_amount_trasaction"]!
                    .map((x) => FacultyAmountTrasaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "username": username,
        "phone": phone,
        "last_login": lastLogin,
        "profile_pic": profilePic,
        "bonus_point": bonusPoint,
        "balance": balance,
        "faculty_amount_trasaction": facultyAmountTrasaction == null
            ? []
            : List<dynamic>.from(
                facultyAmountTrasaction!.map((x) => x.toJson())),
      };
}

class FacultyAmountTrasaction {
  String? id;
  String? amount;
  String? type;
  String? description;
  String? createdAt;

  FacultyAmountTrasaction({
    this.id,
    this.amount,
    this.type,
    this.description,
    this.createdAt,
  });

  factory FacultyAmountTrasaction.fromRawJson(String str) =>
      FacultyAmountTrasaction.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FacultyAmountTrasaction.fromJson(Map<String, dynamic> json) =>
      FacultyAmountTrasaction(
        id: json["id"],
        amount: json["amount"],
        type: json["type"],
        description: json["description"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "type": type,
        "description": description,
        "created_at": createdAt,
      };
}
