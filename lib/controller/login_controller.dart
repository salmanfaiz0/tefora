import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/login_model.dart';

import 'package:http/http.dart' as http;

class LoginController extends ChangeNotifier {
  final emailcontrolelr = TextEditingController();

  final passwordcontroller = TextEditingController();

  Future<bool> setToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', value);
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<LoginPage?> loginApi() async {
    String token =
        "6dkyHTRzw67JqM7z1prvc3DhHmkiJ4u3FjtqXcfkixZyecXOIcDfjU3w91aqvyCBXkOAoGbzfe4hvhmf";
    var url = Uri.parse("http://training.pixbit.in/login");

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var body = {
      'username': emailcontrolelr.text.trim(),
      'password': passwordcontroller.text.trim(),
    };

    var response =
        await http.post(url, headers: headers, body: jsonEncode(body));
    final responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      print("Succesfully Logged in");
    } else {
      print("Failed to log in");
    }
  }
}
