import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
