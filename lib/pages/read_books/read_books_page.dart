import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';



class ReadBooks extends StatefulWidget {
  final String? bookPDF;
  final String? bookName;
  ReadBooks({@required this.bookPDF, @required this.bookName});

  @override
  State<ReadBooks> createState() => _ReadBooksState();
}

class _ReadBooksState extends State<ReadBooks> {



  @override
  Widget build(BuildContext context) {

    final pdfPinchController = PdfController(
      document: PdfDocument.openAsset(widget.bookPDF!),
    );

    return Scaffold(
      appBar:AppBar(
        leading: InkWell(
          onTap:(){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.bookName!.toUpperCase(),
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "voll",
              color: Colors.black),
        ),
      ),
      body: PdfView(
        controller: pdfPinchController,
        scrollDirection: Axis.vertical,
      ),
    );
  }
}

