import 'package:flutter/foundation.dart';
import 'package:pustok/models/books/books.dart';
import 'package:pustok/models/wishlist.dart';
import 'package:pustok/repositories/books/books_repository.dart';
import 'package:pustok/repositories/wishlist/wishlist_repository.dart';

class WishListProvider extends ChangeNotifier{

  final _wishList = WishList();
  List<Books> _wishedBooksList = [];
  bool _status = false;
  List<int> _wishedListBooksID = [];
  bool _allWishedBooksFetch = false;


  // is exist in database
  Future<bool> isBookExistInWishList(WishList wishList)async{
    status = false;
    bool value = await WishListRepository().isBookExistInWishList(wishList.userEmail, wishList.wishedBookID);
    if(value == false){
      status = false; // book in wishlist not existed
    }else{
      status = true; // book is  existed
    }
    notifyListeners();
    return status;
  }


  // insert wished books
  Future<bool> wishListBooksInsert(WishList wishList)async{
    status = false;
    int value = await WishListRepository().wishListBooksInsert(wishList);
    if(value>0){
      status = true;
    }else{
      status = false;
    }
    notifyListeners();
    return status;
  }


  // fetch from database
  Future<bool> wishedListBooksIDFetch(String userEmail) async{
    status = false;
    List<WishList> wishListBooks = await WishListRepository().wishedListBooksIDFetch(userEmail);
    for(WishList wishList in wishListBooks){
      _wishedListBooksID.add(wishList.wishedBookID);
    }

    if(_wishedListBooksID.isNotEmpty){
      status = true;
    }else{
      status = false;
    }
    notifyListeners();
    return status;
  }


  Future<bool> wishedListBooksFetch() async{
    status = false;
    for(int wishedBookID in wishedListBooksID){
      Books books = await BooksRepository().wishedBooksFetch(wishedBookID);
      if(wishedBooksList.contains(books)){
        continue;
      }else{
        wishedBooksList.add(books);
      }
    }
    if(wishedBooksList.isNotEmpty){
      status = true;
    }else{
      status = false;
    }
    notifyListeners();
    return status;
  }









  get wishList => _wishList;

  bool get status => _status;

  set status(bool value) {
    _status = value;
    notifyListeners();
  }


  bool get allWishedBooksFetch => _allWishedBooksFetch;

  set allWishedBooksFetch(bool value) {
    _allWishedBooksFetch = value;
    notifyListeners();
  }

  List<int> get wishedListBooksID => _wishedListBooksID;

  set wishedListBooksID(List<int> value) {
    _wishedListBooksID = value;
    notifyListeners();
  }

  List<Books> get wishedBooksList => _wishedBooksList;

  set wishedBooksList(List<Books> value) {
    _wishedBooksList = value;
    notifyListeners();
  }



}