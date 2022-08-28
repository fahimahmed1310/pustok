import 'package:pustok/database/database_helper/database_helper.dart';
import 'package:pustok/models/purchase.dart';
import 'package:pustok/utils/constants/database_constants/database_constants.dart';

class PurchaseTableQueries{

  // is books existing
  Future<bool> isBookExistInPurchaseList(String userEmail , int purchaseBookID) async{
    final db = await DatabaseHelper().initDatabase();
    final mPurchaseBooks = await db.rawQuery(
        "SELECT * FROM '${DatabaseConstants.PURCHASE_TABLE}' WHERE userEmail = '$userEmail' and purchaseBookID = '$purchaseBookID'");
    List<Purchase> purchase = List.generate(mPurchaseBooks.length, (index) {
      return Purchase(
        purchaseID: mPurchaseBooks[index]['purchaseID'],
        purchaseBookID: mPurchaseBooks[index]['purchaseBookID'],
        userEmail: mPurchaseBooks[index]['userEmail'],
      );
    });
    if(purchase.isEmpty){
      return false;
    }else{
      return true;
    }
  }


  // insert books in purchase table
  Future<int> purchaseBooksInsert (Purchase purchase) async{
    final db = await DatabaseHelper().initDatabase();
    int value = await db.insert(DatabaseConstants.PURCHASE_TABLE, purchase.toMap());
    return value;
  }


  Future<List<Purchase>> purchaseListBooksIDFetch (String userEmail) async{
    final db = await DatabaseHelper().initDatabase();
    final mPurchaseBooks = await db.rawQuery("SELECT * FROM '${DatabaseConstants.PURCHASE_TABLE}' WHERE userEmail = '$userEmail'");
    List<Purchase> purchase = List.generate(mPurchaseBooks.length, (index) {
      return Purchase(
        purchaseID: mPurchaseBooks[index]['purchaseID'],
        purchaseBookID: mPurchaseBooks[index]['purchaseBookID'],
        userEmail: mPurchaseBooks[index]['userEmail'],
      );
    });
    if(purchase.isNotEmpty){
      return purchase;
    }
    else{
      return [];
    }

  }



}