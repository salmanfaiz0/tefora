// To parse this JSON data, do
//
//     final sessionModel = sessionModelFromJson(jsonString);

import 'dart:convert';

class SessionModel {
  int? count;
  dynamic next;
  dynamic previous;
  List<Result>? results;

  SessionModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory SessionModel.fromRawJson(String str) =>
      SessionModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SessionModel.fromJson(Map<String, dynamic> json) => SessionModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  String? id;
  int? autoId;
  DateTime? assignedDate;
  int? assignedHours;
  String? time;
  String? centreName;
  String? chapterTitle;
  String? subjectName;
  String? courseName;
  List<SessionBatch>? sessionBatch;
  String? startTimeByFaculty;
  String? endTimeByFaculty;
  String? progress;
  int? totalHours;
  int? totalHoursTaken;

  Result({
    this.id,
    this.autoId,
    this.assignedDate,
    this.assignedHours,
    this.time,
    this.centreName,
    this.chapterTitle,
    this.subjectName,
    this.courseName,
    this.sessionBatch,
    this.startTimeByFaculty,
    this.endTimeByFaculty,
    this.progress,
    this.totalHours,
    this.totalHoursTaken,
  });

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        autoId: json["auto_id"],
        assignedDate: json["assigned_date"] == null
            ? null
            : DateTime.parse(json["assigned_date"]),
        assignedHours: json["assigned_hours"],
        time: json["time"],
        centreName: json["centre_name"],
        chapterTitle: json["chapter_title"],
        subjectName: json["subject_name"],
        courseName: json["course_name"],
        sessionBatch: json["session_batch"] == null
            ? []
            : List<SessionBatch>.from(
                json["session_batch"]!.map((x) => SessionBatch.fromJson(x))),
        startTimeByFaculty: json["start_time_by_faculty"],
        endTimeByFaculty: json["end_time_by_faculty"],
        progress: json["progress"],
        totalHours: json["total_hours"],
        totalHoursTaken: json["total_hours_taken"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "auto_id": autoId,
        "assigned_date":
            "${assignedDate!.year.toString().padLeft(4, '0')}-${assignedDate!.month.toString().padLeft(2, '0')}-${assignedDate!.day.toString().padLeft(2, '0')}",
        "assigned_hours": assignedHours,
        "time": time,
        "centre_name": centreName,
        "chapter_title": chapterTitle,
        "subject_name": subjectName,
        "course_name": courseName,
        "session_batch": sessionBatch == null
            ? []
            : List<dynamic>.from(sessionBatch!.map((x) => x.toJson())),
        "start_time_by_faculty": startTimeByFaculty,
        "end_time_by_faculty": endTimeByFaculty,
        "progress": progress,
        "total_hours": totalHours,
        "total_hours_taken": totalHoursTaken,
      };
}

class SessionBatch {
  String? id;
  String? batch;
  String? batchName;

  SessionBatch({
    this.id,
    this.batch,
    this.batchName,
  });

  factory SessionBatch.fromRawJson(String str) =>
      SessionBatch.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SessionBatch.fromJson(Map<String, dynamic> json) => SessionBatch(
        id: json["id"],
        batch: json["batch"],
        batchName: json["batch_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "batch": batch,
        "batch_name": batchName,
      };
}
