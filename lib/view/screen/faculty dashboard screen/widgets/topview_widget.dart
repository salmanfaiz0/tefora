import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tefora/view/screen/profile%20screen/profile_screen.dart';

class TopViewWidget extends StatelessWidget {
  const TopViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3.2,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 5, spreadRadius: 1)
          ],
          color: Color.fromRGBO(4, 83, 155, 1),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(22),
              bottomRight: Radius.circular(22))),
      child: Column(
        children: [
          Expanded(
            child: Column(children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ProfileScreen();
                      },
                    ));
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 60,
                    backgroundImage: NetworkImage(
                        "https://cdn3d.iconscout.com/3d/premium/thumb/casual-female-5218540-4358040.png"),
                  )),
              SizedBox(
                height: 5,
              ),
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
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "01",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "02",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "23",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Incomplete",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Pending",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Complete",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}
