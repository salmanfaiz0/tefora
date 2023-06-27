import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:tefora/controller/faculty_controller.dart';
import 'package:tefora/controller/forget_controller.dart';
import 'package:tefora/view/utilis/constant/color_constant.dart';
import 'package:tefora/view/widget/appbar_widgets.dart';
import 'package:tefora/view/widget/textfield_widget.dart';

class ProfileDash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FacultyDash>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBarWidgets("Profile", ColorConst().appcolor, Colors.white),
        body: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textfieldsWidget(value.data!.fullName!),
              SizedBox(
                height: 15,
              ),
              textfieldsWidget(value.data!.username!),
              SizedBox(
                height: 15,
              ),
              textfieldsWidget(value.data!.phone!),
              SizedBox(
                height: 15,
              ),
              textfieldsWidget(value.data!.phone!),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class textfieldsWidget extends StatelessWidget {
  String name;

  textfieldsWidget(this.name);
  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
        // labelText: "To Date",
        labelText: name, prefixIcon: Icon(Icons.pregnant_woman),
        border: OutlineInputBorder(),
      ),
    );
  }
}
