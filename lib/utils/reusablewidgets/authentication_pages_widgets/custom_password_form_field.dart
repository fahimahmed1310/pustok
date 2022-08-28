import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:pustok/providers/authentication/authentication_provider.dart';
import 'package:pustok/utils/constants/strings/app_asset_strings.dart';

class CustomPasswordFormField extends StatelessWidget {

  final TextInputType? keyBoardType;
  final TextEditingController? textEditingController;
  final String? hintText;
  final String? validText;

  CustomPasswordFormField({@required this.keyBoardType, @required this.textEditingController, @required this.validText, @required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationProvider>(
      builder: (_,provider,___) {
        return Container(
          height: 60,
          width:350,
          child: TextFormField(
            obscureText: provider.isObsureText,
            keyboardType: keyBoardType,
            controller: textEditingController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
              hintText: hintText,
              hintStyle: const TextStyle(
                fontFamily: "voll",
              ),
              errorStyle: const TextStyle(fontSize: 11, height: 0.3),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: .5,
                  color: Colors.red,
                ),
              ),
              suffixIcon: GestureDetector(
                onTap: (){
                    if(provider.isObsureText == true){
                      provider.isObsureText= false;
                    }
                    else{
                      provider.isObsureText = true;
                    }
                  },
                child: Container(
                  padding: EdgeInsets.all(13),
                  child: SvgPicture.asset(
                    provider.isObsureText == true?
                        AppAssetStrings.svgEyeClose
                        : AppAssetStrings.svgEye,
                    height: 10,
                    width: 10,
                  ),
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
                return null;
              }
            },
          ),
        );
      }
    );
  }
}