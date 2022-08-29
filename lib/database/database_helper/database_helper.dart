import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pustok/utils/constants/database_constants/database_constants.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  Future<Database> initDatabase() async{
    Directory directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path,'pustok_database13.db');
    return openDatabase(
        path,
        version: 2,
        onCreate: (Database db , int version) async {
          await db.execute(
            "CREATE TABLE "+ DatabaseConstants.USER_TABLE + " (id INTEGER PRIMARY KEY AUTOINCREMENT , username TEXT NOT NULL, password TEXT NOT NULL, phone TEXT , email TEXT NOT NULL, fullName TEXT NOT NULL, gender TEXT )"
                " "
          );
          await db.execute(
              "CREATE TABLE "+ DatabaseConstants.BOOK_TABLE + " (bookID INTEGER PRIMARY KEY AUTOINCREMENT , bookName TEXT NOT NULL, publishedYear TEXT NOT NULL, bookWriter TEXT NOT NULL, bookGenre TEXT NOT NULL, bookCover TEXT NOT NULL, bookPDF TEXT NOT NULL, UNIQUE (bookName, bookCover,bookPDF) ON CONFLICT REPLACE)"
                  " "
          );
          await db.execute(
              "CREATE TABLE "+ DatabaseConstants.WISHLIST_TABLE + " (wishlistID INTEGER PRIMARY KEY AUTOINCREMENT , wishedBookID INTEGER NOT NULL, userEmail TEXT NOT NULL)"
                  " "
          );
          await db.execute(
              "CREATE TABLE "+ DatabaseConstants.PURCHASE_TABLE + " (purchaseID INTEGER PRIMARY KEY AUTOINCREMENT , purchaseBookID INTEGER NOT NULL, userEmail TEXT NOT NULL)"
                  " "
          );
          await db.execute(
              "CREATE TABLE "+ DatabaseConstants.LIBRARY_TABLE + " (libraryBookID INTEGER PRIMARY KEY AUTOINCREMENT , userEmail TEXT NOT NULL, myBookID INTEGER NOT NULL)"
                  " "
          );
        }
    );
  }

}