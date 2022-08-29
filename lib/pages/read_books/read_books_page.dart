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
        title: Text(widget.bookName!.toUpperCase()),
        centerTitle: true,
      ),
      body: PdfView(
        controller: pdfPinchController,
        scrollDirection: Axis.vertical,
      ),
    );
  }
}

