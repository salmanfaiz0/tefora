import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tefora/controller/login_controller.dart';
import 'package:tefora/model/faculty_model.dart';
import 'package:http/http.dart' as http;
import 'package:tefora/model/forget_model.dart';
import 'package:tefora/model/profile_model.dart';
import 'package:tefora/model/session_model.dart';
import 'package:tefora/view/utilis/constant/color_constant.dart';

class ForgetService extends ChangeNotifier {
  @override
  void dispose() {
    // TODO: implement dispose
    oldpassController.text;
    newpassController.text;
    conpassController.text;
    super.dispose();
  }

  final oldpassController = TextEditingController();
  final newpassController = TextEditingController();
  final conpassController = TextEditingController();
  Future<ForgetModel?> getpassword(BuildContext context) async {
    final oldpass = oldpassController.text.trim();
    final newpass = newpassController.text.trim();
    final conpass = conpassController.text.trim();

    if (newpass.isEmpty || conpass.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: ColorConst().appcolor,
          content: Text('Enter your username and password'),
        ),
      );
      try {
        final url = Uri.parse(
            'http://api.afms.tefora.in/api/v1/faculty-app/change-password/');
        String? token = await LoginController().getToken();
        var body = {
          'old_password': oldpassController.text,
          'new_password': newpassController.text,
          "confirm_new_password": conpassController.text,
        };
        var headers = {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'token $token'
        };
        final response =
            await http.put(url, headers: headers, body: jsonEncode(body));
        // print('Token: $token');

        if (response.statusCode == 200) {
          print(response.body);

          final data = jsonDecode(response.body);

          ForgetModel datas = ForgetModel.fromJson(data);

          // print('Themes: $themes');
          return datas;
        } else if (response.statusCode == 401) {
          // print(response.body);
          print('Authentication failed: Invalid or expired token.');

          return null;
        } else {
          print('Failed to load themes: ${response.statusCode}');

          return null;
        }
      } catch (e) {
        print('Failed to load themes: $e');
        return null;
      }
    }
  }
}
