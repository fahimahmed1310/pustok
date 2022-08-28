import 'package:flutter/material.dart';

class LoginRegisterButton extends StatelessWidget {
  final String? buttonName;
  final Function()? onPressed;


  LoginRegisterButton({@required this.buttonName, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.black
      ),
      onPressed: onPressed,
      child: Container(
        height:50,
        width: 150,
        padding: const EdgeInsets.only(top:11),
        child: Text(buttonName!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: "voll",
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
