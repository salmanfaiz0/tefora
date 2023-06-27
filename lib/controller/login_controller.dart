import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tefora/view/screen/faculty%20dashboard%20screen/faculty_dashscreen.dart';
import 'package:tefora/view/utilis/constant/api_constant.dart';
import 'package:tefora/view/utilis/constant/color_constant.dart';

import '../model/login_model.dart';

import 'package:http/http.dart' as http;

class LoginController extends ChangeNotifier {
  @override
  void dispose() {
    // TODO: implement dispose
    emailController.text;
    passwordController.text;
    super.dispose();
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<bool> setToken(String value) async {
    print("Token: $value");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', value);
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final val = prefs.getString('token');
    print("Stored token: $val");
    return prefs.getString('token');
  }

  Future<void> removeToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

  Future<void> loginApi(BuildContext context) async {
    final username = emailController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: ColorConst().appcolor,
          content: Text('Enter your username and password'),
        ),
      );
      return;
    }

    try {
      var url = Uri.parse(ApiConstant().url);

      var headers = {
        'Content-Type': 'application/json',
      };

      var body = {
        'username': username,
        'password': password,
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
        print("Successfully Logged in");

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return FacultyDashPage();
            },
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: ColorConst().appcolor,
            content: Text('Username or password is incorrect'),
          ),
        );
        print("Failed to log in");
      }
    } catch (e) {
      print("Error: $e");
    }

    notifyListeners();
  }
}
