import 'package:pustok/database/books_table_queries/books_table_queries.dart';
import 'package:pustok/models/books/books.dart';

class BooksRepository{


  //books insert
  Future<int> booksInsert (Books books) async{
    return BooksTableQueries().booksInsert(books);
  }

  //books insert
  Future<bool> isBookExist (String bookName) async{
    return BooksTableQueries().isBookExist(bookName);
  }


  Future<List<Books>> booksFetch (String bookGenre) async{
    return BooksTableQueries().booksFetch(bookGenre);
  }

  Future<Books> wishedBooksFetch (int wishedBookID) async{
    return BooksTableQueries().wishedBooksFetch(wishedBookID);
  }



}