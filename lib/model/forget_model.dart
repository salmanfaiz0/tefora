// To parse this JSON data, do
//
//     final forgetModel = forgetModelFromJson(jsonString);

import 'dart:convert';

ForgetModel forgetModelFromJson(String str) =>
    ForgetModel.fromJson(json.decode(str));

String forgetModelToJson(ForgetModel data) => json.encode(data.toJson());

class ForgetModel {
  String oldPassword;
  String newPassword;
  String confirmNewPassword;

  ForgetModel({
    required this.oldPassword,
    required this.newPassword,
    required this.confirmNewPassword,
  });

  factory ForgetModel.fromJson(Map<String, dynamic> json) => ForgetModel(
        oldPassword: json["old_password"],
        newPassword: json["new_password"],
        confirmNewPassword: json["confirm_new_password"],
      );

  Map<String, dynamic> toJson() => {
        "old_password": oldPassword,
        "new_password": newPassword,
        "confirm_new_password": confirmNewPassword,
      };
}
