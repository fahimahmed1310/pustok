import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:pustok/pages/cart/add_to_cart_page.dart';
import 'package:pustok/providers/books_provider/books_provider.dart';
import 'package:pustok/utils/reusablewidgets/category_page/books_view_in_category.dart';

class ActionBooksPage extends StatefulWidget {
  const ActionBooksPage({Key? key}) : super(key: key);

  @override
  State<ActionBooksPage> createState() => _ActionBooksPageState();
}

class _ActionBooksPageState extends State<ActionBooksPage> {

  @override
  void didChangeDependencies() async{
    super.didChangeDependencies();
    BooksProvider booksProvider = await Provider.of<BooksProvider>(context,listen: false);
    await fetchActionBooks(booksProvider);
  }

  Future<void> fetchActionBooks(BooksProvider booksProvider)async{
    await booksProvider.actionBooksFetch("action");
  }



  @override
  Widget build(BuildContext context) {
    return Consumer<BooksProvider>(
      builder: (_,booksProvider,___) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 60,
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 0,
            leading: InkWell(
              onTap:(){
                Navigator.pop(context);
              },
              child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
          ),
            ),
          title: Text(
                "Action Books".toUpperCase(),
              style: const TextStyle(
                fontFamily: "voll",
                fontSize:20,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),
            actions:  [
              Padding(
                padding: EdgeInsets.only(right: 16.0, bottom: 10),
                child: InkWell(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return AddToCartPage();
                    }));
                  },
                  child: const Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
          body: booksProvider.actionBooksList.isEmpty ? const Center(
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
              itemCount: booksProvider.actionBooksList.length,
              itemBuilder: (context,index){
               return BooksViewInCategory(
                 bookCover: booksProvider.actionBooksList[index].bookCover,
                 bookWriter: booksProvider.actionBooksList[index].bookWriter,
                 bookName: booksProvider.actionBooksList[index].bookName,
                 publishedYear: booksProvider.actionBooksList[index].publishedYear,
                 bookId: booksProvider.actionBooksList[index].bookID,
                 bookPDF: booksProvider.actionBooksList[index].bookPDF,
                 bookPage: "category",
               );
              },
            ),
          ),
        );
      }
    );
  }
}


