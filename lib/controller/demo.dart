import 'package:flutter/material.dart';
import 'package:tefora/model/demo_model.dart';

class FacultyDash extends ChangeNotifier {
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
