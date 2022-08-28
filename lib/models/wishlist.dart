class WishList{
  dynamic wishlistID;
  dynamic wishedBookID;
  dynamic userEmail;


  WishList({this.wishlistID, this.userEmail, this.wishedBookID});

  Map<String,dynamic> toMap(){
    return <String,dynamic>{
      "wishListID" : wishlistID,
      "wishedBookID" : wishedBookID,
      "userEmail": userEmail,
    };
  }


}