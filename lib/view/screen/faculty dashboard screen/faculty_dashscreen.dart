import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import 'package:tefora/model/demo_model.dart';
import 'package:tefora/view/screen/faculty%20dashboard%20screen/widgets/topview_widget.dart';
import 'package:tefora/view/screen/notification%20screen/notification_screen.dart';
import 'package:tefora/view/screen/profile%20screen/profile_screen.dart';
import 'package:tefora/view/screen/session%20screen/Ending/ending_screen.dart';
import 'package:tefora/view/screen/session%20screen/Starting/starting_screen.dart';

import 'package:tefora/view/widget/button_widgets.dart';

import '../../../controller/faculty_controller.dart';

class FacultyDashPage extends StatefulWidget {
  @override
  State<FacultyDashPage> createState() => _FacultyDashPageState();
}

class _FacultyDashPageState extends State<FacultyDashPage> {
  @override
  void initState() {
    Provider.of<FacultyDash>(context, listen: false).getalldata();
    Provider.of<FacultyDash>(context, listen: false).getsessionData();
    Provider.of<FacultyDash>(context, listen: false).getcale();

    super.initState();
  }

  final dateFormat = DateFormat('yyyy-MM-dd');
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    menuList(String? course, String? subject, String? status, String? chapter,
        String? batch, String? center) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close),
                    )
                  ],
                ),
                Text("Course: $course"),
                SizedBox(
                  height: 10,
                ),
                Text("Batch:  $batch"),
                SizedBox(
                  height: 10,
                ),
                Text("Subject: $subject"),
                SizedBox(
                  height: 10,
                ),
                Text("Chapter: $chapter"),
                SizedBox(
                  height: 10,
                ),
                Text("Center: $center"),
                SizedBox(
                  height: 10,
                ),
                if (status == "pending")
                  ButtonWidget(
                    buttonName: "Confirm",
                    onPressed: () {
                      Provider.of<FacultyDash>(context, listen: false)
                          .changeStatus("pending");
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return StartingSession();
                        },
                      ));
                    },
                  )
                else if (status == "ongoing")
                  ButtonWidget(
                    buttonName: "Confirm",
                    onPressed: () {
                      Provider.of<FacultyDash>(context, listen: false)
                          .changeStatus("ongoing");
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return EndingScreen();
                        },
                      ));
                    },
                  ),
              ],
            ),
            elevation: 12.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          );
        },
      );
    }

    return Consumer<FacultyDash>(
      builder: (context, testprovider, child) => Scaffold(
        backgroundColor: Color.fromRGBO(231, 231, 231, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(4, 83, 155, 1),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  // Provider.of<FacultyDash>(context, listen: false).getalldata();
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return NotificationScreen();
                    },
                  ));
                },
                icon: Icon(Iconsax.notification))
          ],
          leading: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Container(
                      height: 122,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  readOnly: true,
                                  controller: startDateController,
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: startDate,
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2025),
                                    ).then((selectedDate) {
                                      if (selectedDate != null) {
                                        startDateController.text =
                                            dateFormat.format(selectedDate);
                                      }
                                    });
                                  },
                                  decoration: InputDecoration(
                                    labelText: "To Date",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  readOnly: true,
                                  controller: endDateController,
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: endDate,
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2025),
                                    ).then((selectedDate) {
                                      if (selectedDate != null) {
                                        endDateController.text =
                                            dateFormat.format(selectedDate);
                                      }
                                    });
                                  },
                                  decoration: InputDecoration(
                                    labelText: "From Date",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ButtonWidget(
                              buttonName: "Filter",
                              onPressed: () {
                                Navigator.pop(context);
                                testprovider.getcale();
                              })
                        ],
                      ),
                    ),
                  ),
                );
              },
              icon: Icon(Iconsax.filter)),
          title: Text("Dashboard"),
          centerTitle: true,
        ),
        body: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3.2,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.grey, blurRadius: 5, spreadRadius: 1)
                ],
                color: Color.fromRGBO(4, 83, 155, 1),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(22),
                    bottomRight: Radius.circular(22))),
            child: Column(
              children: [
                Expanded(
                  child: Column(children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return ProfileScreen();
                            },
                          ));
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          maxRadius: 60,
                          backgroundImage: NetworkImage(
                              "https://cdn3d.iconscout.com/3d/premium/thumb/casual-female-5218540-4358040.png"),
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      testprovider.data!.fullName!,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      testprovider.data!.username!,
                      style: TextStyle(fontSize: 14, color: Colors.white30),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "1",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "1",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "1",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Incomplete",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Pending",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Complete",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )
                  ]),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: testprovider.session!.results!.length,
                itemBuilder: (context, index) {
                  print(
                      " list item = ${testprovider.session?.results?.length}");
                  return Padding(
                    padding: const EdgeInsets.all(18),
                    child: GestureDetector(
                      onTap: () {
                        // testprovider.changeStatus(
                        //     testprovider.session!.results![index].progress!);
                        // testprovider.changeStatus()

                        // testprovider.getStatusText(
                        //   testprovider.session!.results![index].progress!,
                        // );
                        // Provider.of<FacultyDash>(context, listen: false)
                        //     .changeStatus(testprovider.session.results![index].progress);

                        // testprovider.getStatusText(
                        //     testprovider.session!.results![index].progress);
                        menuList(
                          testprovider.session!.results![index].courseName,
                          testprovider.session!.results![index].subjectName,
                          testprovider.session!.results![index].progress,
                          testprovider.session!.results![index].chapterTitle,
                          testprovider.session!.results![index]
                              .sessionBatch![index].batchName,
                          testprovider.session!.results![index].centreName,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        width: MediaQuery.of(context).size.width,
                        height: 120,
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  title: Text(
                                    testprovider
                                        .session!.results![index].courseName!,
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        testprovider.session!.results![index]
                                            .chapterTitle!,
                                        style: TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                      Text(testprovider
                                          .session!.results![index].assignedDate
                                          .toString()
                                          .substring(0, 10)),
                                    ],
                                  ),
                                ),
                                LinearPercentIndicator(
                                  width: 300,
                                  addAutomaticKeepAlive: true,
                                  barRadius: const Radius.circular(2),
                                  progressColor: testprovider.getStatusColor(
                                      testprovider
                                          .session!.results![index].progress!),
                                  lineHeight: 14,
                                  percent: testprovider.session!.results![index]
                                          .totalHoursTaken! /
                                      testprovider
                                          .session!.results![index].totalHours!,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 68, left: 11),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "${testprovider.session!.results![index].totalHoursTaken}hr"),
                                      Text(
                                          "${testprovider.session!.results![index].totalHours}hr"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 22),
                                  child: Container(
                                    width: 30,
                                    height: MediaQuery.of(context).size.height,
                                    color: testprovider.getStatusColor(
                                        testprovider.session!.results![index]
                                            .progress!),
                                    child: RotatedBox(
                                      quarterTurns: 1,
                                      child: Center(
                                        child: Text(
                                          testprovider.session!.results![index]
                                              .progress!,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        ]),
      ),
    );
  }
}
