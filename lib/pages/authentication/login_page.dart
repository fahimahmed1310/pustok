import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:pustok/pages/authentication/signup_page.dart';
import 'package:pustok/pages/home/home_page.dart';
import 'package:pustok/providers/authentication/authentication_provider.dart';
import 'package:pustok/utils/constants/strings/app_asset_strings.dart';
import 'package:pustok/utils/reusablewidgets/authentication_pages_widgets/custom_password_form_field.dart';
import 'package:pustok/utils/reusablewidgets/authentication_pages_widgets/custom_text_form_field.dart';
import 'package:pustok/utils/reusablewidgets/authentication_pages_widgets/login_register_button.dart';
import 'package:pustok/utils/shared_preferences/shared_preferences_data.dart';
import 'package:pustok/utils/toast/custom_toast.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late TapGestureRecognizer _tapGestureRecognizer;


  @override
  void initState() {
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer();
    _tapGestureRecognizer.onTap = registerButtonRecognizer;
  }

  void registerButtonRecognizer() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const SignUpPage();
    }));
  }

  @override
  void didChangeDependencies()async {
    super.didChangeDependencies();
    AuthenticationProvider authenticationProvider = await Provider.of<AuthenticationProvider>(context,listen: false);
    isObscureText(authenticationProvider);
  }

  void isObscureText(AuthenticationProvider authenticationProvider){
    authenticationProvider.isObsureText = false;
  }


  @override
  Widget build(BuildContext context) {
          return Consumer<AuthenticationProvider>(
            builder: (_,authenticationProvider,___) {
              return Scaffold(
                appBar: AppBar(
                  toolbarHeight: 100,
                  elevation: 0,
                  backgroundColor: Colors.white,
                  title: Image.asset(
                      AppAssetStrings.appLogo
                  ),
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(right:60),
                      child: Visibility(
                        visible: false,
                        child: Container(),
                      ),
                    )
                  ],
                ),
                body: Form(
                  key: formKey,
                  child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(bottom:30),
                    children: [
                      Column(
                        children: [
                          Lottie.asset(
                              AppAssetStrings.loginPageLottie,
                              height: 200,
                              width: 200
                          ),
                          const SizedBox(
                              height:20
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Welcome Back!".toUpperCase(),
                                style: const TextStyle(
                                    fontFamily: "voll",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Email",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "voll",
                                ),
                              ),
                              const SizedBox(
                                  height:10
                              ),
                              CustomTextFormField(
                                  keyBoardType: TextInputType.emailAddress,
                                  textEditingController: emailController,
                                  hintText: "Enter Your Email Address",
                                  validText: "",
                                  isEmail: true,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Password",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "voll",
                                ),
                              ),
                              const SizedBox(
                                  height:10
                              ),
                              CustomPasswordFormField(
                                keyBoardType: TextInputType.text,
                                textEditingController: passwordController,
                                hintText: "Enter Your Password",
                                validText: "",
                              ),
                            ],
                          ),
                          const SizedBox(
                              height:20
                          ),
                          LoginRegisterButton(
                              buttonName: "Login",
                              onPressed: () async{
                                if(formKey.currentState!.validate()){
                                  String email = emailController!.text;
                                  String password = passwordController!.text;
                                  bool isUserExist = await authenticationProvider.isUserExistWhileLogin(email, password);
                                  if(isUserExist == true){
                                    SharedPreferencesData.setLoggedIn(isLoggedIn: true);
                                    SharedPreferencesData.setUserEmailAfterLogin(userEmail: email );
                                    CustomToast.toastShower("Login Successfully Completed", Colors.green);
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) => HomePage()),
                                            (Route<dynamic> route) => false);
                                  }else{
                                    CustomToast.toastShower("Incorrect email or password", Colors.red);
                                  }
                                }
                              }
                          ),
                          const SizedBox(
                              height:20
                          ),
                          Center(
                            child: RichText(
                              text:   TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Create a new account?',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                        fontFamily: "voll",
                                        color: Colors.black
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' REGISTER ',
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
                          ),


                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
          );
  }
}




