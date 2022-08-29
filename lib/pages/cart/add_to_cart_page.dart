import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:pustok/providers/purchase/purchase_provider.dart';
import 'package:pustok/utils/reusablewidgets/category_page/books_view_in_category.dart';
import 'package:pustok/utils/shared_preferences/shared_preferences_data.dart';

class AddToCartPage extends StatefulWidget {
  const AddToCartPage({Key? key}) : super(key: key);

  @override
  State<AddToCartPage> createState() => _AddToCartPageState();
}

class _AddToCartPageState extends State<AddToCartPage> {

  @override
  void didChangeDependencies() async{
    super.didChangeDependencies();
    PurchaseProvider purchaseProvider = await Provider.of<PurchaseProvider>(context,listen: false);
    purchaseProvider.purchaseBooksList.clear();
    purchaseProvider.purchaseListBooksID.clear();
    await fetchPurchasedBooksInfo(purchaseProvider);
  }

  Future<void> fetchPurchasedBooksInfo(PurchaseProvider purchaseProvider)async{
    bool value = await purchaseProvider.purchaseListBooksIDFetch(SharedPreferencesData.getUserEmailAfterLogin());
    if(value == true){
      await purchaseProvider.purchaseListBooksFetch();
    }

  }



  @override
  Widget build(BuildContext context) {
    return Consumer<PurchaseProvider>(
        builder: (_,purchaseProvider,___) {
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
                "Add To Cart".toUpperCase(),
                style: const TextStyle(
                    fontFamily: "voll",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
            ),
            body: purchaseProvider.purchaseBooksList.isEmpty ? const Center(
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
                itemCount: purchaseProvider.purchaseBooksList.length,
                itemBuilder: (context,index){
                  return BooksViewInCategory(
                    bookCover: purchaseProvider.purchaseBooksList[index].bookCover,
                    bookWriter: purchaseProvider.purchaseBooksList[index].bookWriter,
                    bookName: purchaseProvider.purchaseBooksList[index].bookName,
                    publishedYear: purchaseProvider.purchaseBooksList[index].publishedYear,
                    bookId: purchaseProvider.purchaseBooksList[index].bookID,
                    bookPDF: purchaseProvider.purchaseBooksList[index].bookPDF,
                    bookPage: "cart",
                  );
                },
              ),
            ),
          );
        }
    );
  }
}
