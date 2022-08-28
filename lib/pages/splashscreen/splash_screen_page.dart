import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pustok/pages/authentication/login_page.dart';
import 'package:pustok/pages/category/action_books_page.dart';
import 'package:pustok/pages/home/home_page.dart';
import 'package:pustok/pages/onboarding/onboarding_page.dart';
import 'package:pustok/utils/constants/strings/app_asset_strings.dart';
import 'package:pustok/utils/shared_preferences/shared_preferences_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }

  void initSharedPreferences() async {
    await SharedPreferencesData.initSharedPreferences();
    Timer(const Duration(seconds: 5), () {
      try {
        if (SharedPreferencesData.getLoggedIn() == true) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (BuildContext context) => HomePage()),
              (Route<dynamic> route) => false);
        } else {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => LoginPage()),
              (Route<dynamic> route) => false);
        }
      } catch (error) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => OnboardingPage()),
            (Route<dynamic> route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
              AppAssetStrings.appLogo
          ),
        ],
      ),
    );
  }
}
