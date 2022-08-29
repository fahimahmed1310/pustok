import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
                children: [
                  SizedBox(
                    height: 20 ,
                  ),
                  Lottie.asset(
                    "assets/lottie_files/online_payment.json",
                    height: 300,
                    width: 300
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  // bkash
                  Padding(
                    padding: const EdgeInsets.only(left:45.0,right:45),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Row(
                              children:  [
                                Image.asset(
                                  "assets/logos/bkash_logo.png",
                                  height: 30,
                                  width: 30,
                                )
                              ],
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:  [
                                  InkWell(
                                    onTap: ()async{
                                      // final user = await GoogleSignInRepository.login();
                                      // Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      //   return  TestPage(
                                      //       user: user
                                      //   );
                                      // }));
                                    },
                                    child: const Text(
                                      "BKash",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: "voll",
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),




                  // nogod
                  Padding(
                    padding: const EdgeInsets.only(left:45.0,right:45),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Row(
                              children:  [
                                Image.asset(
                                  "assets/logos/nagad_logo.png",
                                  height: 24,
                                  width: 24,
                                )
                              ],
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:  [
                                  InkWell(
                                    onTap: ()async{
                                      // final user = await GoogleSignInRepository.login();
                                      // Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      //   return  TestPage(
                                      //       user: user
                                      //   );
                                      // }));
                                    },
                                    child: const Text(
                                      "Nogod",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: "voll",
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),




                  //paypal
                  Padding(
                    padding: const EdgeInsets.only(left:45.0,right:45),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Row(
                              children:  [
                                Image.asset(
                                  "assets/logos/pay_pal_logo.png",
                                  height: 30,
                                  width: 30,
                                )
                              ],
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:  [
                                  InkWell(
                                    onTap: ()async{
                                      // final user = await GoogleSignInRepository.login();
                                      // Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      //   return  TestPage(
                                      //       user: user
                                      //   );
                                      // }));
                                    },
                                    child: const Text(
                                      "PayPal",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: "voll",
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),





                  // cash on delivery
                  Padding(
                    padding: const EdgeInsets.only(left:45.0,right:45),
                    child: InkWell(
                      onTap: ()async{
                        bool status = await libraryProvider.libraryBooksInsert(widget.library!);
                        if(status == true){
                          CustomToast.toastShower("Book is purchased", Colors.green);
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return LibraryPage();
                          }));
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black
                          ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Row(
                                children:  const [
                                  Icon(Icons.local_shipping,
                                  size: 24,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:  const [
                                    Text(
                                      "Cash On Delivery",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: "voll",
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
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
