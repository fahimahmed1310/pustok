class Books{
  dynamic bookID;
  dynamic bookName;
  dynamic publishedYear;
  dynamic bookWriter;
  dynamic bookGenre;
  dynamic bookCover;
  dynamic bookPDF;

  Books({this.bookID, this.bookName, this.publishedYear, this.bookWriter, this.bookGenre, this.bookCover, this.bookPDF});

  Map<String,dynamic> toMap(){
    return <String,dynamic>{
      "bookName": bookName,
      "publishedYear": publishedYear,
      "bookWriter": bookWriter,
      "bookGenre": bookGenre,
      "bookCover": bookCover,
      "bookPDF": bookPDF,
    };
  }


}