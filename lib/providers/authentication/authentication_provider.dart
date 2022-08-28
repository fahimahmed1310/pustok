import 'package:flutter/cupertino.dart';
import 'package:pustok/models/user.dart';
import 'package:pustok/repositories/authentication/authentication_repository.dart';

class AuthenticationProvider extends ChangeNotifier{
  bool? _isObsureText = true;
  bool? _status = false;


  // is User Exist When Registration
  Future<bool> isUserExistWhileRegistration(String email, String username)async{
    bool value;
    value = await AuthenticationRepository().isUserExistWhileRegistration(email, username);
    if(value == true){
      status = true;
    }
    else{
      status = false;
    }
    notifyListeners();
    print(status);
    return status;
  }





  // is User Exist When Login
  Future<bool> isUserExistWhileLogin(String email, String password)async{
    bool value;
    value = await AuthenticationRepository().isUserExistWhileLogin(email, password);
    if(value == true){
      status = true;
    }
    else{
      status = false;
    }
    notifyListeners();
    print(status);
    return status;
  }




  // insert new user
  Future<bool> insertNewUser (User user) async{
    int value;
    value = await AuthenticationRepository().insertNewUser(user);
    if(value>0){
      status = true;
    }else{
      status = false;
    }
    notifyListeners();
    return status;
  }





























  bool get status => _status!;

  set status(bool value) {
    _status = value;
    notifyListeners();
  }

  bool get isObsureText => _isObsureText!;

  set isObsureText(bool value) {
    _isObsureText = value;
    notifyListeners();
  }

}