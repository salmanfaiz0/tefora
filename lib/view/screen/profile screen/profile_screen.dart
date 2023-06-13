import 'package:flutter/material.dart';
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
              height: MediaQuery.of(context).size.height / 3.2,
              decoration: BoxDecoration(
                color: Color.fromRGBO(4, 83, 155, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(22),
                  bottomRight: Radius.circular(22),
                ),
              ),
              child: Expanded(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Perform an action when the profile picture is tapped
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        maxRadius: 55,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text("Reshma T.s"),
                    Text("asdas"),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(22)),
                  child: Padding(
                    padding: const EdgeInsets.all(22),
                    child: Column(
                      children: [
                        EmailExpansionPanel(),
                        EmailExpansionPanel(),
                        EmailExpansionPanel(),
                        EmailExpansionPanel(),
                        EmailExpansionPanel(),
                        TextButton(onPressed: () {}, child: Text("Logout"))
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class EmailExpansionPanel extends StatefulWidget {
  @override
  _EmailExpansionPanelState createState() => _EmailExpansionPanelState();
}

class _EmailExpansionPanelState extends State<EmailExpansionPanel> {
  bool _isExpanded = false;
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      elevation: 0,
      expandedHeaderPadding: EdgeInsets.all(0),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _isExpanded = !isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: ListTile(
                  leading: Icon(Icons.portable_wifi_off),
                  title: Text(
                    'Dashboard Profile',
                    style: TextStyle(fontSize: 15),
                  ),
                ));
          },
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Enter Email',
              ),
            ),
          ),
          isExpanded: _isExpanded,
        ),
      ],
    );
  }
}
