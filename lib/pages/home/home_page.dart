import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pustok/pages/cart/add_to_cart_page.dart';
import 'package:pustok/pages/category/action_books_page.dart';
import 'package:pustok/pages/library/library_page.dart';
import 'package:pustok/pages/wishlist/wishlist_page.dart';
import 'package:pustok/providers/books_provider/books_provider.dart';
import 'package:pustok/utils/shared_preferences/shared_preferences_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void didChangeDependencies() async{
    super.didChangeDependencies();
    BooksProvider booksProvider = await Provider.of<BooksProvider>(context,listen: false);
    bool value = await booksProvider.booksInsert();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<BooksProvider>(
      builder: (_,booksProvider,___) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return ActionBooksPage();
                    }));
                  },
                  child: Text("Action Book Pages")
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return ActionBooksPage();
                    }));
                  },
                  child: Text("Action Book Pages")
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return LibraryPage();
                    }));
                  },
                  child: Text("My Library")
              ),
              ElevatedButton(
                  onPressed: (){
                    //print(SharedPreferencesData.getUserNameAfterLogin());
                  },
                  child: Text("Check who is logged in")
              ),
              ElevatedButton(
                  onPressed: (){
                    bool value = SharedPreferencesData.getLoggedIn();
                    print(value);
                  },
                  child: Text("Check what is the status")
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return WishListPage();
                    }));
                  },
                  child: Text("WishList")
              ),
              ElevatedButton(
                  onPressed: (){
                    print(SharedPreferencesData.getLoggedIn());
                  },
                  child: Text("Is Loggin In")
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return AddToCartPage();
                    }));
                  },
                  child: Text("Add To Cart")
              ),
            ],
          )
        );
      }
    );
  }
}
