import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingPageDesign extends StatelessWidget {
  final String? lottieAnimationDirectory;
  final String? mainHeading;
  final String? descriptionText;


  OnboardingPageDesign({@required this.lottieAnimationDirectory, @required this.mainHeading, @required this.descriptionText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Center(
            child: Lottie.asset(
                lottieAnimationDirectory!,
                height: 350,
                width: 350
            ),
          ),
        ),
        SizedBox(
            height:30
        ),
        Text(
          mainHeading!,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: "voll",
          ),
        ),
        SizedBox(
          height:20,
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text(
            descriptionText!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}