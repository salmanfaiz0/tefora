import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:tefora/view/screen/faculty%20dashboard%20screen/faculty_dashscreen.dart';
import 'package:tefora/view/widget/button_widgets.dart';
import 'package:tefora/view/widget/textfield_widget.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(231, 231, 231, 1),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "assets/logo/logo.png",
                scale: 6,
              ),
            ),
            Text("Sign in to your account"),
            SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Email"),
                SizedBox(
                  height: 15,
                ),
                TextfieldWidgets("Email address", null, null, false, true),
                SizedBox(
                  height: 15,
                ),
                Text("Password"),
                SizedBox(
                  height: 15,
                ),
                TextfieldWidgets("Password", null, null, false, true),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            ButtonWidget(
                buttonName: "Log In",
                onPressed: () => Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return FacultyDashPage();
                      },
                    ))),
            SizedBox(
              height: 15,
            ),
            Text("Forgot Password?"),
          ],
        ),
      ),
    );
  }
}
