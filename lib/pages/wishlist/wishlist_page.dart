import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:pustok/providers/books_provider/books_provider.dart';
import 'package:pustok/providers/wishlist/wishlist_provider.dart';
import 'package:pustok/utils/reusablewidgets/category_page/books_view_in_category.dart';
import 'package:pustok/utils/shared_preferences/shared_preferences_data.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({Key? key}) : super(key: key);

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {

  @override
  void didChangeDependencies() async{
    super.didChangeDependencies();
    WishListProvider wishListProvider = await Provider.of<WishListProvider>(context,listen: false);
    wishListProvider.wishedBooksList.clear();
    wishListProvider.wishedListBooksID.clear();
    await fetchWishedBooksInfo(wishListProvider);
  }

  Future<void> fetchWishedBooksInfo(WishListProvider wishListProvider)async{
    bool value = await wishListProvider.wishedListBooksIDFetch(SharedPreferencesData.getUserEmailAfterLogin());
    if(value == true){
      await wishListProvider.wishedListBooksFetch();
    }

  }



  @override
  Widget build(BuildContext context) {
        return Consumer<WishListProvider>(
          builder: (_,wishListProvider,___) {
            return Scaffold(
              appBar: AppBar(
                toolbarHeight: 60,
                backgroundColor: Colors.white,
                centerTitle: true,
                elevation: 0,
                title: Text(
                  "WishList Page".toUpperCase(),
                  style: const TextStyle(
                      fontFamily: "voll",
                      fontSize:25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                ),
                actions: const [
                  Padding(
                    padding: const EdgeInsets.only(right:16.0,bottom: 10),
                    child: Icon(Icons.shopping_cart,
                      color: Colors.black,
                      size: 30,
                    ),
                  )
                ],
              ),
              body: wishListProvider.wishedBooksList.isEmpty ? const Center(
                child: SpinKitCubeGrid(
                  size: 80,
                  color: Colors.black,
                ),
              ):
              SafeArea(
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder:(context, index){
                    return const Padding(
                      padding: EdgeInsets.only(left:10,right: 10),
                      child: Divider(
                        thickness: 1,
                        color: Colors.black,
                      ),
                    );
                  },
                  itemCount: wishListProvider.wishedBooksList.length,
                  itemBuilder: (context,index){
                    return BooksViewInCategory(
                      bookCover: wishListProvider.wishedBooksList[index].bookCover,
                      bookWriter: wishListProvider.wishedBooksList[index].bookWriter,
                      bookName: wishListProvider.wishedBooksList[index].bookName,
                      publishedYear: wishListProvider.wishedBooksList[index].publishedYear,
                      bookId: wishListProvider.wishedBooksList[index].bookID,
                      bookPage: "wishlist",
                    );
                  },
                ),
              ),
            );
          }
        );
      }
}
