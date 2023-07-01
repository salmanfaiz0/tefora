import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:tefora/controller/faculty_controller.dart';
import 'package:tefora/controller/forget_controller.dart';
import 'package:tefora/view/utilis/constant/color_constant.dart';
import 'package:tefora/view/widget/appbar_widgets.dart';
import 'package:tefora/view/widget/button_widgets.dart';
import 'package:tefora/view/widget/textfield_widget.dart';

class ProfileDash extends StatefulWidget {
  @override
  _ProfileDashState createState() => _ProfileDashState();
}

class _ProfileDashState extends State<ProfileDash> {
  bool showTextFields = true;

  bool showSaveButton = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<FacultyDash>(
      builder: (context, facultyvalue, child) => Consumer<ForgetService>(
        builder: (context, fovalue, child) => Scaffold(
          appBar: AppBarWidgets("Profile", ColorConst().appcolor, Colors.white),
          body: Padding(
            padding: const EdgeInsets.all(11),
            child: Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 455,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: ColorConst().appcolor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(22),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (showTextFields)
                            TextFieldsWidget(
                              facultyvalue.data!.fullName!,
                              Icon(Iconsax.emoji_normal),
                            ),
                          SizedBox(
                            height: 15,
                          ),
                          if (showTextFields)
                            TextFieldsWidget(
                              facultyvalue.data!.username!,
                              Icon(Iconsax.personalcard),
                            ),
                          SizedBox(
                            height: 15,
                          ),
                          if (showTextFields)
                            TextFieldsWidget(
                              facultyvalue.data!.phone!,
                              Icon(Iconsax.call),
                            ),
                          SizedBox(
                            height: 30,
                          ),
                          if (showTextFields)
                            ButtonWidget(
                              buttonName: "Change Password",
                              onPressed: () {
                                setState(() {
                                  showTextFields = false;
                                });
                              },
                            ),
                          if (!showTextFields)
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: TextfieldWidgets(
                                        "old password",
                                        null,
                                        Provider.of<ForgetService>(context,
                                                listen: false)
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
                                      Provider.of<ForgetService>(context,
                                              listen: false)
                                          .newpassController,
                                      false,
                                      true),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextfieldWidgets(
                                      "confirm new password",
                                      null,
                                      Provider.of<ForgetService>(context,
                                              listen: false)
                                          .conpassController,
                                      false,
                                      true),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  ButtonWidget(
                                    buttonName: "Save",
                                    onPressed: () {
                                      Provider.of<ForgetService>(context,
                                              listen: false)
                                          .getpassword(context);
                                    },
                                  )
                                ]),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: -72,
                    right: 117,
                    child: CircleAvatar(
                      radius: 65,
                      backgroundImage: NetworkImage(
                          "https://cdn3d.iconscout.com/3d/premium/thumb/casual-female-5218540-4358040.png"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldsWidget extends StatelessWidget {
  final String name;
  final Icon icon;

  const TextFieldsWidget(this.name, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        enabled: false,
        readOnly: true,
        decoration: InputDecoration(
          labelText: name,
          prefixIcon: icon,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
