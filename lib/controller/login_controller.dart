import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tefora/model/faculty_model.dart';
import 'package:tefora/view/utilis/constant/api_constant.dart';

import '../model/login_model.dart';

import 'package:http/http.dart' as http;

class LoginController extends ChangeNotifier {
  final emailcontrolelr = TextEditingController();

  final passwordcontroller = TextEditingController();

  Future<bool> setToken(String value) async {
    print("token : ${value}");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', value);
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> removeToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

  // Future<FacultyModel?> getThemes() async {
  //   final url = Uri.parse('http://10.0.2.2:3000/v1/api/theme');
  //   String token;
  //   getToken().then((value) async {
  //     token = value!;

  //     final response = await http.get(url, headers: {
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer $token',
  //     });
  //     print('Token : ${token}');
  //     print(response);

  //     if (response.statusCode == 200) {
  //       List themesList = jsonDecode(response.body);
  //       List<FacultyModel> themes = [];
  //       for (var themeMap in themesList) {
  //         themes.add(FacultyModel.fromJson(themeMap));
  //       }
  //       return themes;
  //     } else {
  //       throw Exception('Failed to load themes');
  //     }
  //   });
  // }

  Future<LoginModel?> loginApi() async {
    var url = Uri.parse(ApiConstant().url);

    var headers = {
      'Content-Type': 'application/json',
    };

    var body = {
      'username': emailcontrolelr.text,
      'password': passwordcontroller.text,
    };

    var response =
        await http.post(url, headers: headers, body: jsonEncode(body));
    final responseData = json.decode(response.body);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final token = responseData['token'];
      await setToken(token);

      print(token);
      print("Succesfully Logged in");
    } else {
      print("Failed to log in");
    }
  }

  notifyListeners();
}
