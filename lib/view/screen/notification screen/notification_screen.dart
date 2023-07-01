import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:tefora/controller/faculty_controller.dart';
import 'package:tefora/view/widget/appbar_widgets.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FacultyDash>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBarWidgets(
            "Notification", Color.fromRGBO(4, 83, 155, 1), Colors.white),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 15,
            ),
            itemCount: 1,
            itemBuilder: (context, index) {
              // Check if it's the first container
              final isFirstContainer = index == 0;
              final containerColor = isFirstContainer
                  ? Color.fromRGBO(4, 83, 155, 1)
                  : Color.fromRGBO(118, 157, 193, 1);

              return Column(
                children: [
                  Row(children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: containerColor,
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 70,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Center(
                          child: Text(
                              "Hello Faculty Name!\nWelcome to the Platinum Academy Application"),
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(right: 2),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "12:30 PM",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
