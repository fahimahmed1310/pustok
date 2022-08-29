import 'package:pustok/database/database_helper/database_helper.dart';
import 'package:pustok/models/library/library.dart';
import 'package:pustok/utils/constants/database_constants/database_constants.dart';

class LibraryTableQueries{


  // is books existing
  Future<bool> isBookExistInLibrary(String userEmail , int myBookID) async{
    final db = await DatabaseHelper().initDatabase();
    final mLibraryBooks = await db.rawQuery(
        "SELECT * FROM '${DatabaseConstants.LIBRARY_TABLE}' WHERE userEmail = '$userEmail' and myBookID = '$myBookID'");
    List<Library> library = List.generate(mLibraryBooks.length, (index) {
      return Library(
        libraryBookID: mLibraryBooks[index]['libraryBookID'],
        myBookID: mLibraryBooks[index]['myBookID'],
        userEmail: mLibraryBooks[index]['userEmail'],
      );
    });
    if(library.isEmpty){
      return false;
    }else{
      return true;
    }
  }


  // insert books in wishlist table
  Future<int> libraryBooksInsert (Library library) async{
    final db = await DatabaseHelper().initDatabase();
    int value = await db.insert(DatabaseConstants.LIBRARY_TABLE, library.toMap());
    return value;
  }


  //fetch from wishlist table
  Future<List<Library>> libraryListBooksIDFetch (String userEmail) async{
    final db = await DatabaseHelper().initDatabase();
    final mLibraryBooks = await db.rawQuery("SELECT * FROM '${DatabaseConstants.LIBRARY_TABLE}' WHERE userEmail = '$userEmail'");
    List<Library> library = List.generate(mLibraryBooks.length, (index) {
      return Library(
        libraryBookID: mLibraryBooks[index]['libraryBookID'],
        userEmail: mLibraryBooks[index]['userEmail'],
        myBookID: mLibraryBooks[index]['myBookID'],
      );
    });
    if(library.isNotEmpty){
      return library;
    }
    else{
      return [];
    }

  }




}