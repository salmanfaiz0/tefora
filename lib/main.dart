import 'package:flutter/material.dart';

import 'package:tefora/view/screen/login%20screen/login_screen.dart';
import 'package:tefora/view/screen/session%20screen/ending_screen.dart';
import 'package:tefora/view/screen/session%20screen/starting_screen.dart';
import 'package:tefora/view/screen/splash%20screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(231, 231, 231, 1),
      ),
      home: SplashScreen(),
    );
  }
}
