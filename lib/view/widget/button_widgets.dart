import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:tefora/view/screen/faculty%20dashboard%20screen/faculty_dashscreen.dart';

class ButtonWidget extends StatelessWidget {
  String buttonName;

  VoidCallback onPressed;

  ButtonWidget({required this.buttonName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: Color.fromRGBO(4, 83, 155, 1),
            minimumSize: Size(MediaQuery.of(context).size.width, 40)),
        onPressed: onPressed,
        child: Text(buttonName));
  }
}
