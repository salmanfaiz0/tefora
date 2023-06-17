import 'dart:convert';

import 'package:tefora/controller/login_controller.dart';
import 'package:tefora/model/faculty_model.dart';
import 'package:http/http.dart' as http;

class FacultyService {
  Future<FacultyModel?> getThemes() async {
    final url = Uri.parse('http://10.0.2.2:3000/v1/api/theme');
    String token;
    LoginController().getToken().then((value) async {
      token = value!;

      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print('Token : ${token}');
      print(response);

      if (response.statusCode == 200) {
        List themesList = jsonDecode(response.body);
        List<FacultyModel> themes = [];
        for (var themeMap in themesList) {
          themes.add(FacultyModel.fromJson(themeMap));

          print(themes);
        }
        return themes;
      } else {
        throw Exception('Failed to load themes');
      }
    });
  }
}
