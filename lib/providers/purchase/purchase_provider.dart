import 'package:flutter/foundation.dart';
import 'package:pustok/models/books/books.dart';
import 'package:pustok/models/purchase.dart';
import 'package:pustok/repositories/books/books_repository.dart';
import 'package:pustok/repositories/purchase/purchase_repository.dart';

class PurchaseProvider extends ChangeNotifier{

  bool _status = false;
  List<int> _purchaseListBooksID = [];
  List<Books> _purchaseBooksList = [];


// is exist in database
  Future<bool> isBookExistInPurchaseList(Purchase purchase)async{
    status = false;
    bool value = await PurchaseRepository().isBookExistInPurchaseList(purchase.userEmail,purchase.purchaseBookID);
    if(value == false){
      status = false; // book in purchaselist not existed
    }else{
      status = true; // book is  existed
    }
    notifyListeners();
    return status;
  }


  // insert purchased books
  Future<bool> purchaseBooksInsert(Purchase purchase)async{
    status = false;
    int value = await PurchaseRepository().purchaseBooksInsert(purchase);
    if(value>0){
      status = true;
    }else{
      status = false;
    }
    notifyListeners();
    return status;
  }



  // fetch from database
  Future<bool> purchaseListBooksIDFetch(String userEmail) async{
    status = false;
    List<Purchase> purchaseListBooks = await PurchaseRepository().purchaseListBooksIDFetch(userEmail);
    for(Purchase purchase in purchaseListBooks){
      _purchaseListBooksID.add(purchase.purchaseBookID);
    }

    if(_purchaseListBooksID.isNotEmpty){
      status = true;
    }else{
      status = false;
    }
    notifyListeners();
    return status;
  }


  Future<bool> purchaseListBooksFetch() async{
    status = false;
    for(int purchaseBookID in purchaseListBooksID){
      Books books = await BooksRepository().wishedBooksFetch(purchaseBookID);
      if(purchaseBooksList.contains(books)){
        continue;
      }else{
        purchaseBooksList.add(books);
      }
    }
    if(purchaseBooksList.isNotEmpty){
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

  List<int> get purchaseListBooksID => _purchaseListBooksID;

  set purchaseListBooksID(List<int> value) {
    _purchaseListBooksID = value;
    notifyListeners();
  }

  List<Books> get purchaseBooksList => _purchaseBooksList;

  set purchaseBooksList(List<Books> value) {
    _purchaseBooksList = value;
    notifyListeners();
  }
}