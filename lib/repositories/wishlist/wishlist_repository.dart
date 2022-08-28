import 'package:pustok/database/wishlist_table_queries/wishlist_table_queries.dart';
import 'package:pustok/models/wishlist.dart';

class WishListRepository{

  Future<bool> isBookExistInWishList (String userEmail, int wishedBookID)async{
    return WishListTableQueries().isBookExistInWishList(userEmail, wishedBookID);
  }


  Future<int> wishListBooksInsert (WishList wishList)async{
    return WishListTableQueries().wishListBooksInsert(wishList);
  }

  Future<List<WishList>> wishedListBooksIDFetch (String userEmail)async{
    return WishListTableQueries().wishedListBooksIDFetch(userEmail);
  }


}