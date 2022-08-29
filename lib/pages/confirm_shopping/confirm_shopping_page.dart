import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pustok/models/library/library.dart';
import 'package:pustok/pages/library/library_page.dart';
import 'package:pustok/providers/library/library_provider.dart';
import 'package:pustok/utils/toast/custom_toast.dart';



class ConfirmShoppingPage extends StatefulWidget {

  late final Library? library;

  ConfirmShoppingPage({@required this.library});


  @override
  State<ConfirmShoppingPage> createState() => _ConfirmShoppingPageState();
}

class _ConfirmShoppingPageState extends State<ConfirmShoppingPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LibraryProvider>(
        builder: (_, libraryProvider, ___) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 60,
              backgroundColor: Colors.white,
              centerTitle: true,
              elevation: 0,
              title: Text(
                "Confirm Shopping".toUpperCase(),
                style: const TextStyle(
                    fontFamily: "voll",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    onPressed: () {

                    },
                    child: Ink(
                      width: 270,
                      child: ListTile(

                        horizontalTitleGap: 30,
                        leading: Image.asset("assets/logos/bkash_logo.png",
                            width: 60, height: 60),
                        title: Text(
                          "bKash",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "voll",
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    onPressed: () {

                    },
                    child: Ink(
                      width: 270,
                      child: ListTile(
                        horizontalTitleGap: 35,
                        contentPadding: EdgeInsets.only(left: 30),

                        leading: Image.asset("assets/logos/nagad_logo.png",
                            width: 40, height: 40),
                        title: Text(
                          "Nagad",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "voll",
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    onPressed: () {

                    },
                    child: Ink(
                      width: 270,
                      child: ListTile(
                        horizontalTitleGap: 30,
                        leading: Image.asset("assets/logos/pay_pal_logo.png",
                            width: 60, height: 60),
                        title: const Text(
                          "PayPaL",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "voll",
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    onPressed: () async {
                      bool status = await libraryProvider.libraryBooksInsert(widget.library!);
                      if(status == true){
                        CustomToast.toastShower("Book is purchased", Colors.green);
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return LibraryPage();
                        }));
                      }

                    },
                    child: Ink(
                      width: 270,
                      child: const ListTile(
                        contentPadding: EdgeInsets.only(left: 30),
                        horizontalTitleGap: 10,
                        leading: Icon(Icons.shopping_basket,
                          size: 30,
                          color: Colors.red,),
                        title: Text(
                          "Cash On Delivary",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "acme",
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),

                ],

              ),
            ),
          );
        }
    );
  }
}
