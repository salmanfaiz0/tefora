import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:tefora/controller/login_controller.dart';
import 'package:tefora/view/screen/faculty%20dashboard%20screen/faculty_dashscreen.dart';
import 'package:tefora/view/screen/login%20screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkToken();

    // TODO: implement initState
    super.initState();
  }

  Future<void> checkToken() async {
    final loginController =
        Provider.of<LoginController>(context, listen: false);
    final token = await loginController.getToken();

    if (token != null) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return FacultyDashPage();
        },
      ));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return LoginPage();
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return LoginPage();
        },
      ));
    });

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              "assets/logo/logo.png",
              scale: 4,
            ),
          ),
          Expanded(
            child: Image.asset(
              "assets/logo/logo2.png",
              scale: 1,
            ),
          ),
        ],
      )),
    );
  }
}
