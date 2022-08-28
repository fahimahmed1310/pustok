import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputType? keyBoardType;
  final TextEditingController? textEditingController;
  final String? hintText;
  final String? validText;
  final bool? isEmail;

  CustomTextFormField({@required this.keyBoardType, @required this.textEditingController, @required this.hintText, @required this.validText, @required this.isEmail});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width:350,
      child: TextFormField(
        keyboardType: keyBoardType,
        controller: textEditingController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: "voll",
          ),
          errorStyle: const TextStyle(fontSize: 11, height: 0.7),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: .5,
              color: Colors.red,
            ),
          ),

          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Colors.red,
            ),
          ),

          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)
          ),
        ),
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontFamily: "voll",
        ),
        validator: (value){
          if(value == "" || value == null){
            return validText;
          }else{
            if(isEmail == true){
              var email = textEditingController!.text;
              bool isValid = EmailValidator.validate(email);
              if(isValid == true){
                return null;
              }else{
                return validText;
              }
            }else{
              return null;
            }
          }
        },
      ),
    );
  }
}
