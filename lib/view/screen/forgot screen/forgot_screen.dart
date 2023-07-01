import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:tefora/controller/forget_controller.dart';

import 'package:tefora/controller/login_controller.dart';
import 'package:tefora/view/widget/textfield_widget.dart';

class ForgotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ForgetService>(
      builder: (context, value, child) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: TextfieldWidgets(
                      "old password",
                      null,
                      Provider.of<ForgetService>(context, listen: false)
                          .oldpassController,
                      false,
                      true),
                ),
                SizedBox(
                  height: 15,
                ),
                TextfieldWidgets(
                    "new password",
                    null,
                    Provider.of<ForgetService>(context, listen: false)
                        .newpassController,
                    false,
                    true),
                SizedBox(
                  height: 15,
                ),
                TextfieldWidgets(
                    "confirm new password",
                    null,
                    Provider.of<ForgetService>(context, listen: false)
                        .conpassController,
                    false,
                    true),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () {
                      Provider.of<ForgetService>(context, listen: false)
                          .getpassword(context);
                    },
                    child: Text("data"))
              ]),
        ),
      ),
    );
  }
}
