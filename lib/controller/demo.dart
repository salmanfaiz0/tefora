import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tefora/controller/Service/faculty_service.dart';
import 'package:tefora/controller/login_controller.dart';
import 'package:tefora/model/demo_model.dart';
import 'package:tefora/model/faculty_model.dart';
import 'package:http/http.dart' as http;

class FacultyDash extends ChangeNotifier {
  List<FacultyModel> themes = [];

  List<FacultyModel> get _themes => themes;

  final _services = FacultyService();

  Future<void> getalldata() async {
    final result = await _services.getThemes();
    themes = result as List<FacultyModel>;
  }

  List<Subject> suject = [
    Subject(
      "NEET 22-23",
      "Cycle",
      "Ongoing",
    ),
    Subject("JEE 22-23", "Bio Diversity", "Pending"),
    Subject("NEET 22-23", "Cell Cycle", "Complete"),
  ];

  changeStatus(Subject subject) {
    switch (subject.status) {
      case "Pending":
        var index = suject.indexWhere((element) => element == subject);
        suject[index].status = "Ongoing";
        notifyListeners();
        break;

      case "Ongoing":
        var index = suject.indexWhere((element) => element == subject);
        suject[index].status = "Complete";

        notifyListeners();
        break;
    }
  }

  Color getStatusColor(Subject subject) {
    switch (subject.status) {
      case "Pending":
        return Color.fromRGBO(185, 17, 17, 1);
      case "Ongoing":
        return Color.fromRGBO(4, 83, 155, 1);
      case "Complete":
        return Color.fromRGBO(8, 175, 16, 1);
      default:
        return Colors.transparent;
    }
  }

  notifyListeners();
}
