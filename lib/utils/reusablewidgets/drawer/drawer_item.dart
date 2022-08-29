import 'package:flutter/material.dart';


class DrawerItem extends StatelessWidget {
  final IconData? drawerIcon;
  final String? drawerText;
  final Function()? onPressed;
  DrawerItem({@required this.drawerIcon, @required this.drawerText, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          SizedBox(
            width:30,
          ),
          Icon(drawerIcon,
            color: Colors.black,
            size: 20 ,
          ),
          SizedBox(
            width:20,
          ),
          Text(
            drawerText!,
            style: TextStyle(
              fontFamily: "voll",
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),


        ],

      ),
    );
  }
}
