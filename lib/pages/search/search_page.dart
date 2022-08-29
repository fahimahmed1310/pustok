import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pustok/models/books/books.dart';
import 'package:pustok/providers/books_provider/books_provider.dart';
import 'package:pustok/utils/reusablewidgets/category_page/books_view_in_category.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  TextEditingController? searchController = TextEditingController();


  void filterSearchResult(String query, BooksProvider provider) {
     provider.allBooksList = [];
     if (query.isNotEmpty) {
      for (Books books in provider.allBooksSearchList) {
         if (books.bookName!.toLowerCase().contains(query.toLowerCase())) {
           provider.allBooksList.add(books);
         }
      }
     } else {
       provider.allBooksList = provider.allBooksSearchList;
     }
  }



  @override
  Widget build(BuildContext context) {
    return Consumer<BooksProvider>(
      builder: (_,booksProvider,___) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: Text(
              "Search".toUpperCase(),
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "voll",
                  color: Colors.black),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(right:15,left:18,top:20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:   [
                  TextField(
                    onChanged: (value){
                      filterSearchResult(value, booksProvider);
                    },
                    controller: searchController,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "voll"
                    ),

                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(
                          bottom: 10.0, left: 10.0, right: 10.0),

                      prefixIcon: Icon(Icons.search),
                      fillColor: Colors.white,
                      filled: true,
                      labelText: "Search any books",
                      labelStyle: TextStyle(
                        fontFamily: "voll",
                        color: Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2.0
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),

                      ),


                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Search Result".toUpperCase(),
                    style: TextStyle(
                      fontFamily: "voll",
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      //shrinkWrap: true,
                      //physics: NeverScrollableScrollPhysics(),
                      itemCount: booksProvider.allBooksList.length,
                      itemBuilder: (context,index){
                        return BooksViewInCategory(
                          bookCover: booksProvider.allBooksList[index].bookCover,
                          bookWriter: booksProvider.allBooksList[index].bookWriter,
                          bookName: booksProvider.allBooksList[index].bookName,
                          publishedYear: booksProvider.allBooksList[index].publishedYear,
                          bookId: booksProvider.allBooksList[index].bookID,
                          bookPDF: booksProvider.allBooksList[index].bookPDF,
                          bookPage: "category",
                          isFromSearchPage: true,

                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
