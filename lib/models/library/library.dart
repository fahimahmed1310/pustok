class Library{
  dynamic libraryBookID;
  dynamic userEmail;
  dynamic myBookID;

  Library({this.libraryBookID, this.userEmail, this.myBookID});

  Map<String,dynamic> toMap(){
    return <String,dynamic>{
      "libraryBookID" : libraryBookID,
      "userEmail" : userEmail,
      "myBookID": myBookID,
    };
  }



}