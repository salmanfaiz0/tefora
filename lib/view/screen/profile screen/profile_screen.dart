import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:tefora/controller/faculty_controller.dart';
import 'package:tefora/controller/login_controller.dart';
import 'package:tefora/view/screen/login%20screen/login_screen.dart';
import 'package:tefora/view/screen/profile%20screen/widgets/Dashboard/dashborad_widget.dart';
import 'package:tefora/view/screen/profile%20screen/widgets/History/session_history_widget.dart';
import 'package:tefora/view/screen/profile%20screen/widgets/Payment/payment_widget.dart';
import 'package:tefora/view/screen/profile%20screen/widgets/Privacy/privacy_widget.dart';
import 'package:tefora/view/screen/profile%20screen/widgets/Profile%20Widget/profile_widget.dart';
import 'package:tefora/view/screen/profile%20screen/widgets/Reedem/reedem_widget.dart';
import 'package:tefora/view/widget/appbar_widgets.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final result =
          Provider.of<FacultyDash>(context, listen: false).getalldata();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FacultyDash>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBarWidgets(
            "Profile", Color.fromRGBO(4, 83, 155, 1), Colors.white),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4.2,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(4, 83, 155, 1),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(22),
                    bottomRight: Radius.circular(22),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Perform an action when the profile picture is tapped
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              maxRadius: 60,
                              backgroundImage: NetworkImage(
                                  "https://cdn3d.iconscout.com/3d/premium/thumb/casual-female-5218540-4358040.png"),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            value.data?.fullName ?? "",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            value.data?.username ?? "",
                            style:
                                TextStyle(fontSize: 14, color: Colors.white30),
                          ),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22)),
                  child: Padding(
                    padding: const EdgeInsets.all(22),
                    child: Column(
                      children: [
                        ProfileWidget(
                          title: "Dashboard Profile",
                          icon: Iconsax.user_edit,
                          onpress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfileDash(),
                                ));
                          },
                        ),
                        ProfileWidget(
                          title: "Session History",
                          icon: Iconsax.sms,
                          onpress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SessionPage(),
                                ));
                          },
                        ),
                        ProfileWidget(
                          title: "Payment History",
                          icon: Iconsax.archive_book,
                          onpress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PaymentPage(),
                                ));
                          },
                        ),
                        ProfileWidget(
                          title: "Bounce & Redeem",
                          icon: Iconsax.coin,
                          onpress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RedeemPage(),
                                ));
                          },
                        ),
                        ProfileWidget(
                          title: "Privacy & Policy",
                          icon: Iconsax.lock,
                          onpress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PrivacyPage(),
                                ));
                          },
                        ),
                        ProfileWidget(
                          title: "Log out",
                          icon: Iconsax.logout,
                          onpress: () {
                            Provider.of<LoginController>(context, listen: false)
                                .removeToken();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                            print("Logged out");
                          },
                          endIcon: false,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
