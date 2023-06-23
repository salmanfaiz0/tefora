import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:tefora/controller/demo.dart';
import 'package:tefora/view/widget/appbar_widgets.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidgets(
          "Payment History", Color.fromRGBO(4, 83, 155, 1), Colors.white),
      body: Consumer<FacultyDash>(
        builder: (context, value, child) => Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total Earning Amount",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "₹ ${value.data?.balance}",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  color: Colors.black,
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: value.data!.facultyAmountTrasaction!.length,
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(value
                            .data!.facultyAmountTrasaction![index].type
                            .toString()),
                        subtitle: Text(value
                            .data!.facultyAmountTrasaction![index].description
                            .toString()),
                        trailing: Text(
                            "₹ ${value.data!.facultyAmountTrasaction![index].amount}"),
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
