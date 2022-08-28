import 'package:flutter/cupertino.dart';

class OnboardingProvider extends ChangeNotifier{

  bool? _onboardingFinalPage = false;

  bool get onboardingFinalPage => _onboardingFinalPage!;

  set onboardingFinalPage(bool value) {
    _onboardingFinalPage = value;
    notifyListeners();
  }
}