import 'package:flutter/foundation.dart';
import 'package:pustok/models/library/library.dart';
import 'package:pustok/repositories/library/library_repository.dart';

class LibraryProvider extends ChangeNotifier{


  bool _status = false;



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
  Future<bool> wishListBooksInsert(Library library)async{
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





  bool get status => _status;

  set status(bool value) {
    _status = value;
    notifyListeners();
  }



}