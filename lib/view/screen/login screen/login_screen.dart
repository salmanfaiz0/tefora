import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:tefora/controller/login_controller.dart';

import 'package:tefora/view/screen/faculty%20dashboard%20screen/faculty_dashscreen.dart';
import 'package:tefora/view/screen/forgot%20screen/forgot_screen.dart';
import 'package:tefora/view/widget/button_widgets.dart';
import 'package:tefora/view/widget/textfield_widget.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginController>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Color.fromRGBO(231, 231, 231, 1),
        body: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo/logo.png",
                scale: 4,
              ),
              SizedBox(
                height: 55,
              ),
              Text("Sign in to your account"),
              SizedBox(
                height: 35,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email"),
                  SizedBox(
                    height: 15,
                  ),
                  TextfieldWidgets(
                      "Email address",
                      null,
                      Provider.of<LoginController>(context, listen: false)
                          .emailController,
                      false,
                      true),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Password"),
                  SizedBox(
                    height: 15,
                  ),
                  TextfieldWidgets(
                      "Password",
                      null,
                      Provider.of<LoginController>(context, listen: false)
                          .passwordController,
                      false,
                      true),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              ButtonWidget(
                  buttonName: "Log In",
                  onPressed: () {
                    Provider.of<LoginController>(context, listen: false)
                        .loginApi(context);

                    // Provider.of<LoginController>(context, listen: false)
                    //     .getToken();
                  }),
              SizedBox(
                height: 15,
              ),
              TextButton(
                  child: Text("Forgot Password?"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ForgotPage();
                      },
                    ));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
