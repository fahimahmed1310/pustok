import 'package:pustok/database/database_helper/database_helper.dart';
import 'package:pustok/models/wishlist.dart';
import 'package:pustok/utils/constants/database_constants/database_constants.dart';

class WishListTableQueries{


  // is books existing
  Future<bool> isBookExistInWishList(String userEmail , int wishedBookID) async{
    final db = await DatabaseHelper().initDatabase();
    final mWishedBooks = await db.rawQuery(
        "SELECT * FROM '${DatabaseConstants.WISHLIST_TABLE}' WHERE userEmail = '$userEmail' and wishedBookID = '$wishedBookID'");
    List<WishList> wishList = List.generate(mWishedBooks.length, (index) {
      return WishList(
        wishlistID: mWishedBooks[index]['wishlistID'],
        wishedBookID: mWishedBooks[index]['wishedBookID'],
        userEmail: mWishedBooks[index]['userEmail'],
      );
    });
    if(wishList.isEmpty){
      return false;
    }else{
      return true;
    }
  }

  // insert books in wishlist table
  Future<int> wishListBooksInsert (WishList wishList) async{
    final db = await DatabaseHelper().initDatabase();
    int value = await db.insert(DatabaseConstants.WISHLIST_TABLE, wishList.toMap());
    return value;
  }


  //fetch from wishlist table
  Future<List<WishList>> wishedListBooksIDFetch (String userEmail) async{
    final db = await DatabaseHelper().initDatabase();
    final mWishedBooks = await db.rawQuery("SELECT * FROM '${DatabaseConstants.WISHLIST_TABLE}' WHERE userEmail = '$userEmail'");
    List<WishList> wishList = List.generate(mWishedBooks.length, (index) {
      return WishList(
        wishlistID: mWishedBooks[index]['wishlistID'],
        wishedBookID: mWishedBooks[index]['wishedBookID'],
        userEmail: mWishedBooks[index]['userEmail'],
      );
    });
    if(wishList.isNotEmpty){
      return wishList;
    }
    else{
      return [];
    }

  }



  

}
