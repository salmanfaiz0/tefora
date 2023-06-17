import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:iconsax/iconsax.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import 'package:tefora/model/demo_model.dart';
import 'package:tefora/view/screen/faculty%20dashboard%20screen/widgets/topview_widget.dart';
import 'package:tefora/view/screen/notification%20screen/notification_screen.dart';
import 'package:tefora/view/screen/profile%20screen/profile_screen.dart';
import 'package:tefora/view/screen/session%20screen/Ending/ending_screen.dart';
import 'package:tefora/view/screen/session%20screen/Starting/starting_screen.dart';

import 'package:tefora/view/widget/button_widgets.dart';

import '../../../controller/demo.dart';

class FacultyDashPage extends StatefulWidget {
  @override
  State<FacultyDashPage> createState() => _FacultyDashPageState();
}

class _FacultyDashPageState extends State<FacultyDashPage> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    menuList(String? course, String? subject, String? status) {
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
                Text("Batch:"),
                SizedBox(
                  height: 10,
                ),
                Text("Subject: $subject"),
                SizedBox(
                  height: 10,
                ),
                Text("Chapter:"),
                SizedBox(
                  height: 10,
                ),
                Text("Center:"),
                SizedBox(
                  height: 10,
                ),
                if (status == "Pending")
                  ButtonWidget(
                    buttonName: "Confirm",
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return StartingSession();
                        },
                      ));
                    },
                  )
                else if (status == "Ongoing")
                  ButtonWidget(
                    buttonName: "End Session",
                    onPressed: () {
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
      builder: (context, testprovider, _) => Scaffold(
        backgroundColor: Color.fromRGBO(231, 231, 231, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(4, 83, 155, 1),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
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
                    content: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            readOnly: true,
                            controller: TextEditingController(
                              text: startDate.toString(),
                            ),
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: startDate,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2025),
                              ).then((selectedDate) {
                                if (selectedDate != null) {
                                  setState(() {
                                    startDate = selectedDate;
                                  });
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
                            controller: TextEditingController(
                              text: endDate.toString(),
                            ),
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: endDate,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2025),
                              ).then((selectedDate) {
                                if (selectedDate != null) {
                                  setState(() {
                                    endDate = selectedDate;
                                  });
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
                  ),
                );
              },
              icon: Icon(Iconsax.filter)),
          title: Text("Dashboard"),
          centerTitle: true,
        ),
        body: Column(children: [
          TopViewWidget(),
          Expanded(
            child: ListView.builder(
              itemCount: testprovider.suject.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(18),
                child: GestureDetector(
                  onTap: () {
                    // Provider.of<FacultyDash>(context, listen: false)
                    //     .changeStatus(testprovider.suject[index]);
                    menuList(
                      testprovider.suject[index].coues,
                      testprovider.suject[index].subject,
                      testprovider.suject[index].status,
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
                                testprovider.suject[index].coues ?? "",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                testprovider.suject[index].subject ?? "",
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            LinearPercentIndicator(
                              width: 300,
                              addAutomaticKeepAlive: true,
                              barRadius: const Radius.circular(2),
                              progressColor: testprovider
                                  .getStatusColor(testprovider.suject[index]),
                              lineHeight: 14,
                              percent: 14 / 100,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 68, left: 11),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("1hr"),
                                  Text("2hr"),
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
                                color: testprovider
                                    .getStatusColor(testprovider.suject[index]),
                                child: RotatedBox(
                                  quarterTurns: 1,
                                  child: Center(
                                    child: Text(
                                      testprovider.suject[index].status ?? "",
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
              ),
            ),
          )
        ]),
      ),
    );
  }
}
