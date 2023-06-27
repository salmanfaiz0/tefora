import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:tefora/controller/faculty_controller.dart';
import 'package:tefora/view/utilis/constant/color_constant.dart';
import 'package:tefora/view/widget/appbar_widgets.dart';

class RedeemPage extends StatelessWidget {
  const RedeemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidgets(
          "Bounce & Redeem", Color.fromRGBO(4, 83, 155, 1), Colors.white),
      body: Consumer<FacultyDash>(
        builder: (context, value, child) => Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: value.data!.bonusPoint!,
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: ColorConst().appcolor,
                            borderRadius: BorderRadius.circular(12)),
                        child: ListTile(
                          leading: Icon(
                            Icons.payment,
                            color: Colors.white,
                          ),
                          // title: Text(value
                          //     .data!.facultyAmountTrasaction![index].type
                          //     .toString()),
                          // subtitle: Text(value
                          //     .data!.facultyAmountTrasaction![index].description
                          //     .toString()),
                          trailing: Text(
                            "₹ ${value.data!.bonusPoint}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
