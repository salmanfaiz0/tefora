import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tefora/view/widget/appbar_widgets.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidgets("Notification", Colors.transparent, Colors.black),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: 15,
          ),
          itemCount: 11,
          itemBuilder: (context, index) => Column(
            children: [
              Row(children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(22)),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 308,
                  height: 80,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                        "Hello world! , sdsadasdas sadasdasdasds sdsadasdasdasd"),
                  ),
                )
              ]),
              SizedBox(
                height: 5,
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "2:30 AM",
                    style: TextStyle(fontSize: 10),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
