import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:pustok/pages/authentication/welcome_page.dart';
import 'package:pustok/pages/wishlist/wishlist_page.dart';
import 'package:pustok/providers/books_provider/books_provider.dart';
import 'package:pustok/utils/reusablewidgets/drawer/drawer_item.dart';
import 'package:pustok/utils/shared_preferences/shared_preferences_data.dart';
class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {




  @override
  Widget build(BuildContext context) {
    return Container(
            height:double.infinity,
            width: 300,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Consumer<BooksProvider>(
                  builder: (_,booksProvider,___) {
                    return SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top:20.0,left:18,right:23),
                            child:  Image.asset("assets/logos/pustok_removebg_preview.png"),
                          ),
                          SizedBox(
                            height:40,
                          ),
                          DrawerItem(
                            drawerText: "Profile".toUpperCase(),
                            drawerIcon: FontAwesomeIcons.user,
                            onPressed: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (context){
                              //   return UserProfilePage();
                              // })
                              // );
                            },
                          ),
                          SizedBox(
                            height:30,
                          ),
                          DrawerItem(
                            drawerText: "WishList".toUpperCase(),
                            drawerIcon: FontAwesomeIcons.heart,
                            onPressed: () {
                               Navigator.push(context, MaterialPageRoute(builder: (context){
                                 return WishListPage();
                               }));
                            },
                          ),
                          SizedBox(
                            height:30,
                          ),
                          DrawerItem(
                            drawerText: "Request A Book".toUpperCase(),
                            drawerIcon: FontAwesomeIcons.book,
                            onPressed: () async{

                              // bool value = await provider.deleteUserAccount(DatabaseConstants.USER_TABLE_NAME);
                              // if(value == true){
                              //   pustokProvider.addShopList.clear();
                              //   pustokProvider.confirmedBuyBookList.clear();
                              //   pustokProvider.myPurchasedBookList.clear();
                              //   CustomToast.toastShower("Account Successfully Deleted", Colors.green);
                              //   Navigator.push(context, MaterialPageRoute(builder: (context) {
                              //     return WelcomePage();
                              //   })
                              //   );
                              // }else{
                              //   CustomToast.toastShower("Something is wrong, Check Again", Colors.red);
                              // }


                            },
                          ),
                          SizedBox(
                            height:30,
                          ),
                          DrawerItem(
                            drawerText: "Report a problem".toUpperCase(),
                            drawerIcon: FontAwesomeIcons.exclamationCircle,
                            onPressed: () async{

                              // bool value = await provider.deleteUserAccount(DatabaseConstants.USER_TABLE_NAME);
                              // if(value == true){
                              //   pustokProvider.addShopList.clear();
                              //   pustokProvider.confirmedBuyBookList.clear();
                              //   pustokProvider.myPurchasedBookList.clear();
                              //   CustomToast.toastShower("Account Successfully Deleted", Colors.green);
                              //   Navigator.push(context, MaterialPageRoute(builder: (context) {
                              //     return WelcomePage();
                              //   })
                              //   );
                              // }else{
                              //   CustomToast.toastShower("Something is wrong, Check Again", Colors.red);
                              // }


                            },
                          ),
                          SizedBox(
                            height:30,
                          ),
                          DrawerItem(
                            drawerText: "Log Out".toUpperCase(),
                            drawerIcon: FontAwesomeIcons.backward,
                            onPressed: (){
                              SharedPreferencesData.setLoggedIn(isLoggedIn: false);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (BuildContext context) => WelcomePage()),
                                      (Route<dynamic> route) => false);
                              // pustokProvider.addShopList.clear();
                              // pustokProvider.confirmedBuyBookList.clear();
                              // pustokProvider.myPurchasedBookList.clear();
                              // MemoryManagement.setLoggedIn(isLogged: false);
                              // provider.users.clear();
                              // Navigator.push(context, MaterialPageRoute(builder: (context) {
                              //   return WelcomePage();
                              // })
                              // );
                            },
                          ),

                        ],
                      ),
                    );
                  }
              ),
            ),
          );
        }
}
