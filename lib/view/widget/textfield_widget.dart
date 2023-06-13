import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TextfieldWidgets extends StatelessWidget {
  String? textname;

  Icon? iconWidgets;

  bool? istrue;

  bool? isenable;

  TextEditingController? controller;
  TextfieldWidgets(
    this.textname,
    this.iconWidgets,
    this.controller,
    this.istrue,
    this.isenable,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: TextField(
        enabled: isenable,
        readOnly: istrue!,
        controller: controller,
        decoration: InputDecoration(
            hintText: textname,
            suffixIcon: iconWidgets,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(8))),
      ),
    );
  }
}
