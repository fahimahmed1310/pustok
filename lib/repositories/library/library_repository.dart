import 'package:pustok/database/library_table_queries/library_table_queries.dart';
import 'package:pustok/models/library/library.dart';

class LibraryRepository{

  Future<bool> isBookExistInLibrary(String userEmail , int myBookID) async{
    return LibraryTableQueries().isBookExistInLibrary(userEmail, myBookID);
  }


  Future<int> libraryBooksInsert(Library library) async{
    return LibraryTableQueries().libraryBooksInsert(library);
  }

  Future<List<Library>> libraryListBooksIDFetch(String userEmail) async{
    return LibraryTableQueries().libraryListBooksIDFetch(userEmail);
  }

}