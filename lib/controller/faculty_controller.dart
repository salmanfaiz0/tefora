import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tefora/controller/Service/celander_service.dart';
import 'package:tefora/controller/Service/faculty_service.dart';
import 'package:tefora/controller/Service/session_service.dart';
import 'package:tefora/controller/login_controller.dart';
import 'package:tefora/model/demo_model.dart';
import 'package:tefora/model/faculty_model.dart';
import 'package:http/http.dart' as http;
import 'package:tefora/model/profile_model.dart';
import 'package:tefora/model/session_model.dart';

class FacultyDash extends ChangeNotifier {
  ProfileModel? data;

  ProfileModel? get _data => data;

  SessionModel? session;

  SessionModel? get _sessions => session;

  final _services = FacultyService();

  final _session = SessionService();

  final _calender = CalendarService();

  Future<ProfileModel?> getalldata() async {
    final result = await _services.getThemes();
    if (result != null) {
      print(result);
      print("result is not null, ProfileModel");
      data = result;
      notifyListeners();
    }
  }

  Future<SessionModel?> getsessionData() async {
    final results = await _session.getSession();
    if (results != null) {
      print(results);
      print("result is not null , SessionModel");
      session = results;
      notifyListeners();
    }
  }

  Future<SessionModel?> getcale() async {
    final results = await _calender.getcalender();
    if (results != null) {
      print(results);
      print("result is not null, Calender");
      session = results;
      notifyListeners();
    }
    return session;
  }

  // List<Subject> suject = [
  //   Subject(
  //     "NEET 22-23",
  //     "Cycle",
  //     "Ongoing",
  //   ),
  //   Subject("JEE 22-23", "Bio Diversity", "Pending"),
  //   Subject("NEET 22-23", "Cell Cycle", "Complete"),
  // ];

  // changeStatus(Subject subject) {
  //   switch (subject.status) {
  //     case "Pending":
  //       var index = suject.indexWhere((element) => element == subject);
  //       suject[index].status = "Ongoing";
  //       notifyListeners();
  //       break;

  //     case "Ongoing":
  //       var index = suject.indexWhere((element) => element == subject);
  //       suject[index].status = "Complete";

  //       notifyListeners();
  //       break;
  //   }
  // }

  // Color getStatusColor(Subject subject) {
  //   switch (subject.status) {
  //     case "Pending":
  //       return Color.fromRGBO(185, 17, 17, 1);
  //     case "Ongoing":
  //       return Color.fromRGBO(4, 83, 155, 1);
  //     case "Complete":
  //       return Color.fromRGBO(8, 175, 16, 1);
  //     default:
  //       return Colors.transparent;
  //   }
  // }

  // changeStatus(Subject subject) {
  //   switch (subject.status) {
  //     case "Pending":
  //       var index = suject.indexWhere((element) => element == subject);
  //       suject[index].status = "Ongoing";
  //       notifyListeners();
  //       break;

  //     case "Ongoing":
  //       var index = suject.indexWhere((element) => element == subject);
  //       suject[index].status = "Complete";

  //       notifyListeners();
  //       break;
  //   }
  // }

  changeStatus(String progress) {
    var index =
        session!.results!.indexWhere((element) => element.progress == progress);
    if (index != -1) {
      switch (progress) {
        case "pending":
          session!.results![index].progress = "ongoing";
          notifyListeners();
          break;

        case "ongoing":
          session!.results![index].progress = "complete";
          notifyListeners();
          break;
      }
    }
  }

  Color getStatusColor(String progress) {
    if (progress == "pending") {
      return Color.fromRGBO(185, 17, 17, 1);
    } else if (progress == "ongoing") {
      return Color.fromRGBO(4, 83, 155, 1);
    } else {
      // Return a default color if the progress value is neither "Pending" nor "Ongoing"
      return Color.fromRGBO(8, 175, 16, 1);
    }
  }

  notifyListeners();
}
