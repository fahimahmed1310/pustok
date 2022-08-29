import 'package:flutter/foundation.dart';
import 'package:pustok/models/books/books_list.dart';
import 'package:pustok/models/books/books.dart';
import 'package:pustok/repositories/books/books_repository.dart';


class BooksProvider extends ChangeNotifier{

  List<Books> _actionBooksList = [];
  List<Books> _topChartBooksList = [];
  List<Books> _allBooksList = [];
  List<Books> _allBooksSearchList = [];

  final _booksList = BooksList();
  bool _status = false;



  // books insert
  Future<bool> booksInsert()async{
    status = false;
    int value = 0;
    for(Books books in _booksList.booksList){
      bool isBookExist = await BooksRepository().isBookExist(books.bookName);
      if(isBookExist == false){
        value = await BooksRepository().booksInsert(books);
      }else{
        continue;
      }
    }
    if(value>0){
      status = true;
    }else{
      status = false;
    }
    notifyListeners();
    return status;
  }




  // action books fetch
  Future<bool> actionBooksFetch(String bookGenre)async{
    status = false;
    actionBooksList = await BooksRepository().booksFetch(bookGenre);
    if(actionBooksList.isNotEmpty){
      status = true;
    }else{
      status = false;
    }
    notifyListeners();
    return status;
  }


  // all books fetch
  Future<bool> allBooksFetch()async{
    status = false;
    allBooksList = await BooksRepository().allBooksFetch();
    allBooksSearchList = allBooksList;
    if(allBooksList.isNotEmpty){
      status = true;
    }else{
      status = false;
    }
    notifyListeners();
    return status;
  }






  Future<bool> topChartBooksFetch(String bookGenre)async{
    status = false;
    topChartBooksList = await BooksRepository().booksFetch(bookGenre);
    if(topChartBooksList.isNotEmpty){
      status = true;
    }else{
      status = false;
    }
    notifyListeners();
    return status;
  }




























  List<Books> get actionBooksList => _actionBooksList;

  set actionBooksList(List<Books> value) {
    _actionBooksList = value;
    notifyListeners();
  }


  List<Books> get topChartBooksList => _topChartBooksList;

  set topChartBooksList(List<Books> value) {
    _topChartBooksList = value;
    notifyListeners();
  }


  List<Books> get allBooksList => _allBooksList;

  set allBooksList(List<Books> value) {
    _allBooksList = value;
    notifyListeners();
  }

  get booksList => _booksList;

  bool get status => _status;

  set status(bool status) {
    _status = status;
    notifyListeners();
  }

  List<Books> get allBooksSearchList => _allBooksSearchList;

  set allBooksSearchList(List<Books> value) {
    _allBooksSearchList = value;
    notifyListeners();
  }
}