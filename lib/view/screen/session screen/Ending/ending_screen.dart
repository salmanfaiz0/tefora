import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tefora/view/screen/faculty%20dashboard%20screen/faculty_dashscreen.dart';
import 'package:tefora/view/widget/button_widgets.dart';
import 'package:tefora/view/widget/textfield_widget.dart';

class EndingScreen extends StatefulWidget {
  @override
  _EndingScreenState createState() => _EndingScreenState();
}

class _EndingScreenState extends State<EndingScreen> {
  TimeOfDay _time = TimeOfDay.now();

  Future<void> _selectEndingTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );

    if (pickedTime != null && pickedTime != _time) {
      setState(() {
        _time = pickedTime;
      });
    }
  }

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
            Text("Choose Your Ending Class Time"),
            SizedBox(height: 15),
            InkWell(
              onTap: () => _selectEndingTime(context),
              child: TextfieldWidgets(
                "Ending Time",
                Icon(Iconsax.timer),
                TextEditingController(text: _time.format(context)),
                true,
                false,
              ),
            ),
            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SizedBox(
                height: 255,
                child: TextField(
                  maxLines: 22,
                  maxLength: 100,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: "Feedback from your session",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            ButtonWidget(
              buttonName: "Submit",
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) {
                  return FacultyDashPage();
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
