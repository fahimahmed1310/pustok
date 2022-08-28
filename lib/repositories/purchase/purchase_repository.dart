import 'package:pustok/database/purchase_table_queries/purchase_table_queries.dart';
import 'package:pustok/models/purchase.dart';

class PurchaseRepository{

  Future<bool> isBookExistInPurchaseList(String userEmail , int purchaseBookID) async{
    return PurchaseTableQueries().isBookExistInPurchaseList(userEmail, purchaseBookID);
  }


  Future<int> purchaseBooksInsert(Purchase purchase)async{
    return PurchaseTableQueries().purchaseBooksInsert(purchase);
  }


  Future<List<Purchase>> purchaseListBooksIDFetch (String userEmail) async{
    return PurchaseTableQueries().purchaseListBooksIDFetch(userEmail);
  }

}