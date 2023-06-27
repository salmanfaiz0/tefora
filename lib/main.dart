import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tefora/controller/forget_controller.dart';
import 'package:tefora/controller/faculty_controller.dart';
import 'package:tefora/controller/login_controller.dart';

import 'package:tefora/view/screen/login%20screen/login_screen.dart';

import 'package:tefora/view/screen/splash%20screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginController(),
        ),
        ChangeNotifierProvider(
          create: (context) => FacultyDash(),
        ),
        ChangeNotifierProvider(
          create: (context) => ForgetService(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Color.fromRGBO(231, 231, 231, 1),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
