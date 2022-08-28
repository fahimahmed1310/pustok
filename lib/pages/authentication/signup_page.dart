import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pustok/models/user.dart';
import 'package:pustok/pages/authentication/login_page.dart';
import 'package:pustok/providers/authentication/authentication_provider.dart';
import 'package:pustok/utils/constants/strings/app_asset_strings.dart';
import 'package:pustok/utils/reusablewidgets/authentication_pages_widgets/custom_password_form_field.dart';
import 'package:pustok/utils/reusablewidgets/authentication_pages_widgets/custom_text_form_field.dart';
import 'package:pustok/utils/reusablewidgets/authentication_pages_widgets/login_register_button.dart';
import 'package:pustok/utils/toast/custom_toast.dart';



class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  late TapGestureRecognizer _tapGestureRecognizer;


  @override
  void initState() {
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer();
    _tapGestureRecognizer.onTap = loginButtonRecognizer;
  }

  void loginButtonRecognizer() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const LoginPage();
    }));
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
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(bottom:30),
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Create An Account".toUpperCase(),
                              style: const TextStyle(
                                  fontFamily: "voll",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 27
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
                              "Full Name",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "voll",
                              ),
                            ),
                            const SizedBox(
                                height:5
                            ),
                            CustomTextFormField(
                              keyBoardType: TextInputType.emailAddress,
                              textEditingController: fullNameController,
                              hintText: "Enter Your Full Name",
                              validText: "Please Write Your Full Name ",
                              isEmail: false,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "User Name",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "voll",
                              ),
                            ),
                            const SizedBox(
                                height:5
                            ),
                            CustomTextFormField(
                              keyBoardType: TextInputType.emailAddress,
                              textEditingController: userNameController,
                              hintText: "Enter Your User Name",
                              validText: "Please Write Your User Name ",
                              isEmail: false,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Email",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "voll",
                              ),
                            ),
                            const SizedBox(
                                height:5
                            ),
                            CustomTextFormField(
                              keyBoardType: TextInputType.emailAddress,
                              textEditingController: emailController,
                              hintText: "Enter Your Email Address",
                              validText: "Please enter a valid email",
                              isEmail: true,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "New Password",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "voll",
                              ),
                            ),
                            const SizedBox(
                                height:5
                            ),
                            CustomPasswordFormField(
                              keyBoardType: TextInputType.text,
                              textEditingController: passwordController,
                              hintText: "Enter Your Password",
                              validText: "Please Write Your Password",
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Confirm Password",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "voll",
                              ),
                            ),
                            const SizedBox(
                                height:5
                            ),
                            CustomPasswordFormField(
                              keyBoardType: TextInputType.text,
                              textEditingController: confirmPasswordController,
                              hintText: "Enter Your Password",
                              validText: "Please Re-Write Your Password",
                            ),
                          ],
                        ),
                        const SizedBox(
                            height:10
                        ),
                        LoginRegisterButton(
                            buttonName: "Register",
                            onPressed: ()async {
                              if(formKey.currentState!.validate()){
                                if(passwordController.text == confirmPasswordController.text){
                                  User user = User(
                                    email: emailController.text,
                                    username: userNameController.text,
                                    password: passwordController.text,
                                    fullName: fullNameController.text,
                                  );
                                  bool isUserExist = await authenticationProvider.isUserExistWhileRegistration(emailController.text, userNameController.text);
                                  if(isUserExist == true){
                                      CustomToast.toastShower("User is already existed", Colors.redAccent);
                                  }else{
                                    bool userRegistered = await authenticationProvider.insertNewUser(user);
                                    if(userRegistered == true){
                                      CustomToast.toastShower("Registration Complete", Colors.green);
                                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                                        return  LoginPage();
                                      }));
                                    }
                                    else{
                                      CustomToast.toastShower("Registration Failed", Colors.red);
                                    }
                                  }

                                }
                              }
                            }
                        ),
                        const SizedBox(
                            height:10
                        ),
                        Center(
                          child: RichText(
                            text:   TextSpan(
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
                                  text: ' LOGIN ',
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
            ),
          );
         }
          );
  }
}
