import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:pustok/pages/cart/add_to_cart_page.dart';
import 'package:pustok/pages/category/action_books_page.dart';
import 'package:pustok/pages/category/top_chart_books_page.dart';
import 'package:pustok/pages/drawer/drawer_page.dart';
import 'package:pustok/pages/wishlist/wishlist_page.dart';
import 'package:pustok/providers/books_provider/books_provider.dart';
import 'package:pustok/providers/home/home_provider.dart';
import 'package:pustok/utils/reusablewidgets/home_page/home_page_book_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    BooksProvider booksProvider =
        await Provider.of<BooksProvider>(context, listen: false);
    await fetchAllBooks(booksProvider);
  }

  Future<void> fetchAllBooks(BooksProvider booksProvider) async {
    await booksProvider.allBooksFetch();
    await booksProvider.actionBooksFetch("action");
    await booksProvider.topChartBooksFetch("top");
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Consumer<BooksProvider>(builder: (_, booksProvider, ___) {
      return Consumer<HomeProvider>(builder: (_, homeProvider, ___) {
        return booksProvider.topChartBooksList.isEmpty ? const Center(
          child: SpinKitCubeGrid(
            size: 80,
            color: Colors.black,
          ),
        ) : Scaffold(
            key: scaffoldKey,
            drawer: DrawerPage(),
            appBar: AppBar(
              leading: IconButton(
                onPressed: (){
                  scaffoldKey.currentState!.openDrawer();
                },
                icon: Icon(Icons.view_module,
                  color: Colors.black,
                ),
              ),

              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "home".toUpperCase(),
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "voll",
                    color: Colors.black),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 16.0, bottom: 10),
                  child: InkWell(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return WishListPage();
                      }));
                    },
                    child: Icon(
                        FontAwesomeIcons.heart,
                      color: Colors.black,
                    ),
                    // child: const Icon(
                    //   Icons.heart_broken,
                    //   color: Colors.black,
                    //   size: 30,
                    // ),
                  ),
                ),
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
            body: booksProvider.allBooksList.isEmpty
                ? const Center(
                    child: SpinKitCubeGrid(
                      size: 80,
                      color: Colors.black,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 30.0, left: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          // Recently Added
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Recently Added".toUpperCase(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "voll",
                                    fontSize: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "View All",
                                      style: TextStyle(
                                        fontFamily: "voll",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.white
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: SizedBox(
                              height:200,
                              child: ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      width: 5,
                                    );
                                  },
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return HomePageBookView(
                                        bookCover: booksProvider
                                            .allBooksList[index].bookCover,
                                        bookName: booksProvider
                                            .allBooksList[index].bookName);
                                  }),
                            ),
                          ),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Top Chart".toUpperCase(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "voll",
                                    fontSize: 20),
                              ),
                              InkWell(
                                onTap:(){
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return TopChartBooksPage();
                                  }));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right:10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "View All",
                                        style: TextStyle(
                                            fontFamily: "voll",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.white
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: SizedBox(
                              height: 200,
                              child: ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      width: 5,
                                    );
                                  },
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return HomePageBookView(
                                        bookCover: booksProvider
                                            .topChartBooksList[index].bookCover,
                                        bookName: booksProvider
                                            .topChartBooksList[index].bookName);
                                  }),
                            ),
                          ),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Action".toUpperCase(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "voll",
                                    fontSize: 20),
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return ActionBooksPage();
                                  }));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right:10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "View All",
                                        style: TextStyle(
                                            fontFamily: "voll",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.white
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: SizedBox(
                              height: 200,
                              child: ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      width: 5,
                                    );
                                  },
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return HomePageBookView(
                                        bookCover: booksProvider
                                            .actionBooksList[index].bookCover,
                                        bookName: booksProvider
                                            .actionBooksList[index].bookName);
                                  }),
                            ),
                          ),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Mystery".toUpperCase(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "voll",
                                    fontSize: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "View All",
                                      style: TextStyle(
                                          fontFamily: "voll",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: SizedBox(
                              height: 200,
                              child: ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      width: 5,
                                    );
                                  },
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return HomePageBookView(
                                        bookCover: booksProvider
                                            .topChartBooksList[index].bookCover,
                                        bookName: booksProvider
                                            .topChartBooksList[index].bookName);
                                  }),
                            ),
                          ),



                        ],
                      ),
                    ),
                  ));
      });
    });
  }
}
