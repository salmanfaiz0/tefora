import 'dart:convert';
import 'dart:math';

import 'package:tefora/controller/login_controller.dart';
import 'package:tefora/model/faculty_model.dart';
import 'package:http/http.dart' as http;
import 'package:tefora/model/profile_model.dart';
import 'package:tefora/model/session_model.dart';

class SessionService {
  Future<SessionModel?> getSession() async {
    final url =
        Uri.parse('http://api.afms.tefora.in/api/v1/faculty-app/session/');

    try {
      String? token = await LoginController().getToken();

      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'token $token',
      });
      // print('Token: $token');

      if (response.statusCode == 200) {
        print(response.body);

        final data = jsonDecode(response.body);

        SessionModel datas = SessionModel.fromJson(data);

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
