import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:pustok/pages/authentication/login_page.dart';
import 'package:pustok/pages/authentication/signup_page.dart';
import 'package:pustok/pages/test/test_page.dart';
import 'package:pustok/providers/books_provider/books_provider.dart';
import 'package:pustok/repositories/authentication/google_sign_in_repository.dart';
import 'package:pustok/utils/constants/strings/app_asset_strings.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  late TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer();
    _tapGestureRecognizer.onTap = loginButtonRecognizer;
  }


  @override
  void didChangeDependencies()async {
    super.didChangeDependencies();
    BooksProvider booksProvider = await Provider.of<BooksProvider>(context,listen: false);
    bool value = await booksProvider.booksInsert();
  }


  void loginButtonRecognizer() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const LoginPage();
    }));
  }


  @override
  void dispose() {
    super.dispose();
    _tapGestureRecognizer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BooksProvider>(
      builder: (_,booksProvider,___) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height:60,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Hello There!",
                      style: TextStyle(
                          fontFamily: "voll",
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      '"Knowledge is Power" - Francis Bacon',
                      style: TextStyle(
                          fontFamily: "voll",
                          fontSize: 18
                      ),
                    )
                  ],
                ),
                const SizedBox(
                    height:60
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                        "assets/lottie_files/girl_with_books.json",
                        height: 300,
                        width: 300
                    ),
                  ],
                ),
                const SizedBox(
                    height:40
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:45.0,right:45),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Row(
                                children:  [
                                  Image.asset(
                                    AppAssetStrings.googleLogo,
                                    height: 24,
                                    width: 24,
                                  )
                                ],
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:  [
                                    InkWell(
                                      onTap: ()async{
                                       final user = await GoogleSignInRepository.login();
                                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                                          return  TestPage(
                                                user: user
                                          );
                                        }));
                                      },
                                      child: const Text(
                                        "Sign in with Google",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: "voll",
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                        height:10
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:45.0,right:45),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.facebook,
                                    size: 24,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Sign in with Facebook",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: "voll",
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                        height:10
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:45.0,right:45),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.black
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    AppAssetStrings.svgSignUp,
                                    height: 20,
                                    width: 20,
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:  [
                                    InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                                          return  SignUpPage();
                                        }));
                                      },
                                      child: Text(
                                        "Create an account",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: "voll",
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                        height:20
                    ),
                    Center(
                      child: RichText(
                        text:  TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Already have an account?',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  fontFamily: "voll",
                                  color: Colors.black
                              ),
                            ),
                            TextSpan(
                              text: ' LOGIN',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontFamily: "voll",
                                  color: Colors.black
                              ),
                              recognizer: _tapGestureRecognizer,
                            ),

                          ],
                        ),
                      ),
                    )
                  ],
                )


              ],
            ),
          ),
        );
      }
    );
  }
}
