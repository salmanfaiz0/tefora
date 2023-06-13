import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:iconsax/iconsax.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:tefora/view/screen/notification%20screen/notification_screen.dart';
import 'package:tefora/view/screen/profile%20screen/profile_screen.dart';
import 'package:tefora/view/screen/session%20screen/starting_screen.dart';
import 'package:tefora/view/widget/button_widgets.dart';

class FacultyDashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    menuList() {
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
                            icon: Icon(Icons.close))
                      ],
                    ),
                    Text("Course :"),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Batch :"),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Subject :"),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Chapter :"),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Center :"),
                    SizedBox(
                      height: 10,
                    ),
                    ButtonWidget(
                        buttonName: "Confirm",
                        onPressed: () =>
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return StartingSession();
                              },
                            )))
                  ],
                ),
                elevation: 12.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)));
          });
    }

    return Scaffold(
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
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2025),
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
                    "Reshma T.s",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "XXXXX231",
                    style: TextStyle(fontSize: 14, color: Colors.white30),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "01",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "02",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "23",
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
            itemCount: 4,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(18),
              child: GestureDetector(
                onTap: () {
                  menuList();
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
                        children: [
                          const ListTile(
                            title: Text("NEET 22-23"),
                            subtitle: Text("Cycle"),
                          ),
                          LinearPercentIndicator(
                            width: 300,
                            addAutomaticKeepAlive: true,
                            barRadius: const Radius.circular(16),
                            progressColor: Colors.green,
                            lineHeight: 14,
                            percent: 14 / 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 68, left: 11),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              color: Colors.green,
                              child: RotatedBox(
                                  quarterTurns: 1,
                                  child: Center(child: Text("Pending"))),
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
    );
  }
}
