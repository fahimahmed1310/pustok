class Purchase{
  dynamic purchaseID;
  dynamic purchaseBookID;
  dynamic userEmail;


  Purchase({this.purchaseID, this.purchaseBookID, this.userEmail});

  Map<String,dynamic> toMap(){
    return <String,dynamic>{
      "purchaseID" : purchaseID,
      "purchaseBookID" : purchaseBookID,
      "userEmail": userEmail,
    };
  }
}