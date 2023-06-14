import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tefora/view/widget/appbar_widgets.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidgets(
          "Notification", Color.fromRGBO(4, 83, 155, 1), Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: 15,
          ),
          itemCount: 11,
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
                    width: 320,
                    height: 70,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Center(
                        child: Text(
                            "Hello world! , sdsadasdas sadasdasdasds sdsadasdasdasd"),
                      ),
                    ),
                  ),
                ]),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "2:30 AM",
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
