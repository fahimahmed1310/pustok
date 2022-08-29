import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:pustok/providers/library/library_provider.dart';
import 'package:pustok/utils/reusablewidgets/category_page/books_view_in_category.dart';
import 'package:pustok/utils/shared_preferences/shared_preferences_data.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {


  @override
  void didChangeDependencies() async{
    super.didChangeDependencies();
    LibraryProvider libraryProvider = await Provider.of<LibraryProvider>(context,listen: false);
    libraryProvider.libraryBooksList.clear();
    libraryProvider.libraryListBooksID.clear();
    await fetchLibraryBooksInfo(libraryProvider);
  }

  Future<void> fetchLibraryBooksInfo(LibraryProvider libraryProvider)async{
    bool value = await libraryProvider.libraryListBooksIDFetch(SharedPreferencesData.getUserEmailAfterLogin());
    if(value == true){
      await libraryProvider.libraryListBooksFetch();
    }

  }





  @override
  Widget build(BuildContext context) {
    return Consumer<LibraryProvider>(
        builder: (_,libraryProvider,___) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 60,
              backgroundColor: Colors.white,
              centerTitle: true,
              elevation: 0,
              title: Text(
                "My Library".toUpperCase(),
                style: const TextStyle(
                    fontFamily: "voll",
                    fontSize:25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
            ),
            body: libraryProvider.libraryBooksList.isEmpty ? const Center(
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
                itemCount: libraryProvider.libraryBooksList.length,
                itemBuilder: (context,index){
                  return BooksViewInCategory(
                    bookCover: libraryProvider.libraryBooksList[index].bookCover,
                    bookWriter: libraryProvider.libraryBooksList[index].bookWriter,
                    bookName: libraryProvider.libraryBooksList[index].bookName,
                    publishedYear: libraryProvider.libraryBooksList[index].publishedYear,
                    bookId: libraryProvider.libraryBooksList[index].bookID,
                    bookPDF: libraryProvider.libraryBooksList[index].bookPDF,
                    bookPage: "library",
                  );
                },
              ),
            ),
          );
        }
    );
  }
}