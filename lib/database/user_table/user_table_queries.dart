import 'package:pustok/database/database_helper/database_helper.dart';
import 'package:pustok/models/user.dart';
import 'package:pustok/utils/constants/database_constants/database_constants.dart';
import 'package:sqflite/sqflite.dart';

class UserTableQueries{



  //insert New user
   Future<int> insertNewUser(User user)async{
    final db = await DatabaseHelper().initDatabase();
    int value = await db.insert(DatabaseConstants.USER_TABLE, user.toMap(),conflictAlgorithm: ConflictAlgorithm.ignore);
    print(value);
    return value;
  }


  //is User Exist when registration
   Future<bool> isUserExistWhileRegistration(
      String email, String username) async {
    final db = await DatabaseHelper().initDatabase();
    final mUser = await db.rawQuery(
        "SELECT * FROM user WHERE email = '$email' or username = '$username'");
    List<User> users = List.generate(mUser.length, (index) {
      return User(
        id: mUser[index]['id'],
        password: mUser[index]['password'],
        phone: mUser[index]['phone'],
        email: mUser[index]['email'],
        fullName: mUser[index]['fullName'],
        gender: mUser[index]['gender'],
      );
    });
    if (users.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  // is User Exist when login
  Future<bool> isUserExistWhileLogin(String email, String password) async {
    final db = await DatabaseHelper().initDatabase();
    final mUser = await db.rawQuery(
        "SELECT * FROM user WHERE email = '$email' and password = '$password'");
    List<User> users = List.generate(mUser.length, (index) {
      return User(
        id: mUser[index]['id'],
        password: mUser[index]['password'],
        phone: mUser[index]['phone'],
        email: mUser[index]['email'],
        fullName: mUser[index]['fullName'],
        gender: mUser[index]['gender'],
      );
    });
    if (users.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }


}