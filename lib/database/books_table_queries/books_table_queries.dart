import 'package:pustok/database/database_helper/database_helper.dart';
import 'package:pustok/models/books/books.dart';
import 'package:pustok/utils/constants/database_constants/database_constants.dart';
import 'package:sqflite/sqflite.dart';

class BooksTableQueries{


  //insert books in database
  Future<int> booksInsert (Books books) async{
    final db = await DatabaseHelper().initDatabase();
    int value = await db.insert(DatabaseConstants.BOOK_TABLE, books.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
    return value;
  }

  Future<bool> isBookExist(String bookName) async {
    final db = await DatabaseHelper().initDatabase();
    final mBooks = await db.rawQuery(
        "SELECT * FROM '${DatabaseConstants.BOOK_TABLE}' WHERE bookName = '$bookName'");
    List<Books> books = List.generate(mBooks.length, (index) {
      return Books(
        bookID: mBooks[index]['bookID'],
        bookName: mBooks[index]['bookName'],
        publishedYear: mBooks[index]['publishedYear'],
        bookWriter: mBooks[index]['bookWriter'],
        bookGenre: mBooks[index]['bookGenre'],
        bookCover: mBooks[index]['bookCover'],
        bookPDF: mBooks[index]['bookPDF'],
      );
    });
    if (books.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }



  //fetch books from database
  Future<List<Books>> booksFetch (String bookGenre) async{
    final db = await DatabaseHelper().initDatabase();
    final mBooks = await db.rawQuery("SELECT * FROM '${DatabaseConstants.BOOK_TABLE}' WHERE bookGenre = '${bookGenre}'");
    List<Books> books = List.generate(mBooks.length, (index) {
      return Books(
        bookID: mBooks[index]['bookID'],
        bookName: mBooks[index]['bookName'],
        publishedYear: mBooks[index]['publishedYear'],
        bookWriter: mBooks[index]['bookWriter'],
        bookGenre: mBooks[index]['bookGenre'],
        bookCover: mBooks[index]['bookCover'],
        bookPDF: mBooks[index]['bookPDF'],
      );
    });
    if(books.isNotEmpty){
      return books;
    }
    else{
      return [];
    }

  }



  //fetch books from database
  Future<Books> wishedBooksFetch (int wishedBookID) async{
    final db = await DatabaseHelper().initDatabase();
    final mBooks = await db.rawQuery("SELECT * FROM '${DatabaseConstants.BOOK_TABLE}' WHERE bookID = '${wishedBookID}'");
    List<Books> books = List.generate(mBooks.length, (index) {
      return Books(
        bookID: mBooks[index]['bookID'],
        bookName: mBooks[index]['bookName'],
        publishedYear: mBooks[index]['publishedYear'],
        bookWriter: mBooks[index]['bookWriter'],
        bookGenre: mBooks[index]['bookGenre'],
        bookCover: mBooks[index]['bookCover'],
        bookPDF: mBooks[index]['bookPDF'],
      );
    });
    if(books.isNotEmpty){
      return books.first;
    }
    else{
      return Books();
    }
  }


}