import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pustok/models/purchase.dart';
import 'package:pustok/models/wishlist.dart';
import 'package:pustok/providers/purchase/purchase_provider.dart';
import 'package:pustok/providers/wishlist/wishlist_provider.dart';
import 'package:pustok/utils/shared_preferences/shared_preferences_data.dart';
import 'package:pustok/utils/toast/custom_toast.dart';

class BooksViewInCategory extends StatelessWidget {

  final String? bookCover;
  final String? bookName;
  final String? bookWriter;
  final String? publishedYear;
  final int? bookId;

  BooksViewInCategory({@required this.bookCover,@required this.bookName, @required this.bookWriter, @required this.publishedYear, this.bookId});


  @override
  Widget build(BuildContext context) {
    return Consumer<WishListProvider>(
      builder: (_,wishListProvider,___) {
        return Consumer<PurchaseProvider>(
          builder: (_,purchaseProvider,___) {
            return Padding(
              padding: const EdgeInsets.only(left:20.0,top: 20,bottom: 20),
              child: Row(
                children: [
                  Container(
                    height:220,
                    width: 140,
                    child: Image.asset(
                      bookCover!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            bookId!.toString(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                bookName!.toUpperCase(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "voll",
                                  fontSize: 23,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                bookWriter!.toUpperCase(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "voll",
                                  fontSize: 18,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                         Text(
                          publishedYear!,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              fontFamily: "voll"
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black),
                                onPressed: () async{
                                  Purchase purchase = Purchase(
                                    purchaseBookID: bookId,
                                    userEmail: SharedPreferencesData.getUserEmailAfterLogin()
                                  );
                                  bool status = await purchaseProvider
                                      .isBookExistInPurchaseList(purchase);
                                  if (status == false) {
                                    await purchaseProvider.purchaseBooksInsert(purchase);
                                    CustomToast.toastShower("Added to the cart", Colors.green);
                                  }
                                  else{
                                    CustomToast.toastShower("Already added to the cart", Colors.red);
                                  }
                                },
                                child: const Text(
                                  "Add To Cart",
                                  style: TextStyle(
                                      fontFamily: "voll",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black),
                                onPressed: () async {
                                     WishList wishList = WishList(
                                       userEmail: SharedPreferencesData.getUserEmailAfterLogin(),
                                       wishedBookID: bookId,
                                     );
                                     bool isExist = await wishListProvider.isBookExistInWishList(wishList);
                                     if(isExist == false){
                                       await wishListProvider.wishListBooksInsert(wishList);
                                       CustomToast.toastShower("Book added", Colors.green);
                                     }else{
                                       CustomToast.toastShower("Book Already in wishlist", Colors.red);
                                     }
                                },
                                child: const Text(
                                  "WishList",
                                  style: TextStyle(
                                      fontFamily: "voll",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),

                          ],
                        )


                      ],
                    ),
                  )
                ],
              ),
            );
          }
        );
      }
    );
  }
}