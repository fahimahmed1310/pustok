import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pustok/pages/authentication/welcome_page.dart';
import 'package:pustok/providers/onboarding/onboarding_provider.dart';
import 'package:pustok/utils/constants/strings/app_asset_strings.dart';
import 'package:pustok/utils/reusablewidgets/onboarding_page/onboarding_page_design.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {

  final pageController = PageController();




  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardingProvider>(
        builder: (_,onboardingProvider,___) {
          return Scaffold(
            body: Container(
              padding: const EdgeInsets.only(bottom:80),
              child: PageView(
                controller: pageController,
                onPageChanged: (index){
                  if(index == 2){
                    onboardingProvider.onboardingFinalPage = true;
                  }
                },
                children: [
                  OnboardingPageDesign(
                    lottieAnimationDirectory: AppAssetStrings.onboardingPage1,
                    mainHeading: "Large Library".toUpperCase(),
                    descriptionText: "One of the largest e-book library with thousands of books and classics from all over the world",
                  ),
                  OnboardingPageDesign(
                    lottieAnimationDirectory: AppAssetStrings.onboardingPage2,
                    mainHeading: "Read From Anywhere".toUpperCase(),
                    descriptionText: "Access and read your books from anywhere in the world and take your experience to another level",
                  ),

                  OnboardingPageDesign(
                    lottieAnimationDirectory: AppAssetStrings.onboardingPage3,
                    mainHeading: "Request Your Books".toUpperCase(),
                    descriptionText: "Request your books to us. We will make sure you can have your favourite books to read from our sites",
                  ),

                ],
              ),
            ),
            bottomSheet: Padding(
                padding: const EdgeInsets.only(bottom: 20.0,left:16,right:16),
                child: onboardingProvider.onboardingFinalPage == false  ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: InkWell(
                        onTap:(){
                          pageController.jumpToPage(2);
                        },
                        child: const Text(
                          "Skip",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: "voll",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:13.0),
                      child: SmoothPageIndicator(
                        controller: pageController,
                        axisDirection: Axis.horizontal,
                        count: 3,
                        effect: const WormEffect(
                          spacing: 16,
                          activeDotColor: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: InkWell(
                        onTap:(){
                          pageController.nextPage(
                              duration: const Duration(seconds: 1),
                              curve: Curves.ease
                          );
                        },
                        child: const Text(
                          "Next",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: "voll",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ): Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: InkWell(
                        onTap:(){
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (BuildContext context) => WelcomePage()),
                                  (Route<dynamic> route) => false);
                        },
                        child: const Text(
                          "Get Started",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: "voll",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
            ),
          );
        }
    );
  }
}


