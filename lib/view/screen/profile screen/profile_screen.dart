import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tefora/view/widget/appbar_widgets.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBarWidgets("Profile", Color.fromRGBO(4, 83, 155, 1), Colors.white),
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
                          "Reshma T.s",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "XXXXX231",
                          style: TextStyle(fontSize: 14, color: Colors.white30),
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
                        onpress: () {},
                      ),
                      ProfileWidget(
                        title: "Session History",
                        icon: Iconsax.sms,
                        onpress: () {},
                      ),
                      ProfileWidget(
                        title: "Payment History",
                        icon: Iconsax.archive_book,
                        onpress: () {},
                      ),
                      ProfileWidget(
                        title: "Bounce & Redeem",
                        icon: Iconsax.coin,
                        onpress: () {},
                      ),
                      ProfileWidget(
                        title: "Privacy & Policy",
                        icon: Iconsax.lock,
                        onpress: () {},
                      ),
                      ProfileWidget(
                        title: "Log out",
                        icon: Iconsax.logout,
                        onpress: () {
                          print("context.hashCode");
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
    );
  }
}

class ProfileWidget extends StatelessWidget {
  final String title;
  final IconData icon;

  final VoidCallback onpress;
  final bool endIcon;

  ProfileWidget({
    required this.title,
    required this.icon,
    required this.onpress,
    this.endIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onpress,
      trailing: endIcon ? Icon(Iconsax.arrow_right) : null,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Color.fromRGBO(4, 83, 155, 1),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(title),
    );
  }
}
