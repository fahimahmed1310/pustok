import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pustok/pages/category/action_books_page.dart';
import 'package:pustok/pages/home/home_page.dart';
import 'package:pustok/pages/library/library_page.dart';
import 'package:pustok/pages/search/search_page.dart';
import 'package:pustok/providers/home/home_provider.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({Key? key}) : super(key: key);

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {



  final screens = [
    HomePage(),
    SearchPage(),
    LibraryPage(),

  ];



  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_,homeProvider,___) {
        return Scaffold(
          body: screens[homeProvider.selectedIndex],
          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              elevation: 10,
              indicatorColor: Colors.grey,
              labelTextStyle: MaterialStateProperty.all(
                TextStyle(
                  fontSize: 15,
                  fontFamily: "voll",
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            child: NavigationBar(
              selectedIndex: homeProvider.selectedIndex,
              onDestinationSelected: (index){
                homeProvider.selectedIndex = index;
              },
              height: 80,
              backgroundColor: Colors.white,
              destinations: [
                NavigationDestination(
                    icon: Icon(Icons.home_filled),
                    label: "Home"
                ),
                NavigationDestination(
                    icon: Icon(Icons.search),
                    label: "Search"
                ),
                NavigationDestination(
                    icon: Icon(Icons.local_library_rounded),
                    label: "Library"
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
