import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInRepository{
  //static final _googleSignIn = GoogleSignIn();



  static Future<GoogleSignInAccount?> login(){
    return GoogleSignIn().signIn();
  }

}