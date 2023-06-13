import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:iconsax/iconsax.dart';

import 'package:tefora/view/screen/faculty%20dashboard%20screen/faculty_dashscreen.dart';
import 'package:tefora/view/screen/session%20screen/ending_screen.dart';
import 'package:tefora/view/widget/button_widgets.dart';
import 'package:tefora/view/widget/textfield_widget.dart';

class StartingSession extends StatefulWidget {
  @override
  State<StartingSession> createState() => _StartingSessionState();
}

class _StartingSessionState extends State<StartingSession> {
  TimeOfDay _time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(231, 231, 231, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Session"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Choose Your Starting Class Time"),
            SizedBox(
              height: 15,
            ),
            TextfieldWidgets(
                "Ending Time",
                const Icon(Iconsax.timer),
                TextEditingController(text: _time.format(context)),
                true,
                false),
            // TextFormField(
            //   readOnly: true,
            //   controller: TextEditingController(text: ),
            //   decoration: InputDecoration(
            //     prefixIcon: IconButton(
            //       onPressed: () {
            //         // _selectTime();
            //       },
            //       icon: Icon(Icons.dns_sharp),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 15,
            ),
            ButtonWidget(
              buttonName: "Continue",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EndingScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
