import 'package:flutter/foundation.dart';
import 'package:pustok/models/books/books.dart';
import 'package:pustok/models/library/library.dart';
import 'package:pustok/repositories/books/books_repository.dart';
import 'package:pustok/repositories/library/library_repository.dart';

class LibraryProvider extends ChangeNotifier{


  List<Books> _libraryBooksList = [];
  bool _status = false;
  List<int> _libraryListBooksID = [];



  // is exist in database
  Future<bool> isBookExistInLibrary(Library library)async{
    status = false;
    bool value = await LibraryRepository().isBookExistInLibrary(library.userEmail, library.myBookID);
    if(value == false){
      status = false; // book in wishlist not existed
    }else{
      status = true; // book is  existed
    }
    notifyListeners();
    return status;
  }



  // insert wished books
  Future<bool> libraryBooksInsert(Library library)async{
    status = false;
    int value = await LibraryRepository().libraryBooksInsert(library);
    if(value>0){
      status = true;
    }else{
      status = false;
    }
    notifyListeners();
    return status;
  }


  // fetch from database
  Future<bool> libraryListBooksIDFetch(String userEmail) async{
    status = false;
    List<Library> libraryListBooks = await LibraryRepository().libraryListBooksIDFetch(userEmail);
    for(Library library in libraryListBooks){
      _libraryListBooksID.add(library.myBookID);
    }

    if(_libraryListBooksID.isNotEmpty){
      status = true;
    }else{
      status = false;
    }
    notifyListeners();
    return status;
  }


  Future<bool> libraryListBooksFetch() async{
    status = false;
    for(int libraryBookID in libraryListBooksID){
      Books books = await BooksRepository().wishedBooksFetch(libraryBookID);
      if(libraryBooksList.contains(books)){
        continue;
      }else{
        libraryBooksList.add(books);
      }
    }
    if(libraryBooksList.isNotEmpty){
      status = true;
    }else{
      status = false;
    }
    notifyListeners();
    return status;
  }













  bool get status => _status;

  set status(bool value) {
    _status = value;
    notifyListeners();
  }

  List<Books> get libraryBooksList => _libraryBooksList;

  set libraryBooksList(List<Books> value) {
    _libraryBooksList = value;
    notifyListeners();
  }

  List<int> get libraryListBooksID => _libraryListBooksID;

  set libraryListBooksID(List<int> value) {
    _libraryListBooksID = value;
    notifyListeners();
  }




}