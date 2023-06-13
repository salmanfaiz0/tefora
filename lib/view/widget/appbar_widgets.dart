import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AppBarWidgets extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  String headername;

  Color bgColor;

  Color textColor;

  AppBarWidgets(
    this.headername,
    this.bgColor,
    this.textColor,
  );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: bgColor,
      // backgroundColor: Color.fromRGBO(4, 83, 155, 1),
      title: Text(
        headername,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
