// To parse this JSON data, do
//
//     final facultyModel = facultyModelFromJson(jsonString);

import 'dart:convert';

FacultyModel facultyModelFromJson(String str) =>
    FacultyModel.fromJson(json.decode(str));

String facultyModelToJson(FacultyModel data) => json.encode(data.toJson());

class FacultyModel {
  String fullName;
  String username;
  String phone;
  DateTime lastLogin;
  dynamic profilePic;

  FacultyModel({
    required this.fullName,
    required this.username,
    required this.phone,
    required this.lastLogin,
    this.profilePic,
  });

  factory FacultyModel.fromJson(Map<String, dynamic> json) => FacultyModel(
        fullName: json["full_name"],
        username: json["username"],
        phone: json["phone"],
        lastLogin: DateTime.parse(json["last_login"]),
        profilePic: json["profile_pic"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "username": username,
        "phone": phone,
        "last_login": lastLogin.toIso8601String(),
        "profile_pic": profilePic,
      };
}
