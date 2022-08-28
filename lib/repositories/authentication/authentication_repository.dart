import 'package:pustok/database/user_table/user_table_queries.dart';
import 'package:pustok/models/user.dart';

class AuthenticationRepository{


  //insert new user
  Future<int> insertNewUser (User user) async {
    return UserTableQueries().insertNewUser(user);
  }

  //is user exist while registration
  Future<bool> isUserExistWhileRegistration(String email,String username)async{
    return UserTableQueries().isUserExistWhileRegistration(email, username);
  }



  //is user exist while login
  Future<bool> isUserExistWhileLogin(String email,String password)async{
    return UserTableQueries().isUserExistWhileLogin(email, password);
  }


}