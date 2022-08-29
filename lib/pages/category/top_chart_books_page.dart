import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:pustok/providers/books_provider/books_provider.dart';
import 'package:pustok/utils/reusablewidgets/category_page/books_view_in_category.dart';

class TopChartBooksPage extends StatefulWidget {
  const TopChartBooksPage({Key? key}) : super(key: key);

  @override
  State<TopChartBooksPage> createState() => _TopChartBooksPageState();
}

class _TopChartBooksPageState extends State<TopChartBooksPage> {

  @override
  void didChangeDependencies() async{
    super.didChangeDependencies();
    BooksProvider booksProvider = await Provider.of<BooksProvider>(context,listen: false);
    await fetchActionBooks(booksProvider);
  }

  Future<void> fetchActionBooks(BooksProvider booksProvider)async{
    await booksProvider.topChartBooksFetch("top");
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
              title: Text(
                "Top Chart Books".toUpperCase(),
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
            body: booksProvider.topChartBooksList.isEmpty ? const Center(
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
                itemCount: booksProvider.topChartBooksList.length,
                itemBuilder: (context,index){
                  return BooksViewInCategory(
                    bookCover: booksProvider.topChartBooksList[index].bookCover,
                    bookWriter: booksProvider.topChartBooksList[index].bookWriter,
                    bookName: booksProvider.topChartBooksList[index].bookName,
                    publishedYear: booksProvider.topChartBooksList[index].publishedYear,
                    bookId: booksProvider.topChartBooksList[index].bookID,
                    bookPage: "category",
                    bookPDF: booksProvider.topChartBooksList[index].bookPDF,
                  );
                },
              ),
            ),
          );
        }
    );
  }
}


