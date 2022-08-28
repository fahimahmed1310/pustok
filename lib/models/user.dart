class User{
  dynamic id;
  dynamic username;
  dynamic password;
  dynamic phone;
  dynamic email;
  dynamic fullName;
  dynamic gender;

  User({this.id,this.username,this.password,this.phone,this.email,this.fullName,this.gender});

  Map<String,dynamic> toMap(){
    return <String,dynamic>{
      "username":username,
      "password":password,
      "phone":phone,
      "email":email,
      "fullName":fullName,
      "gender":gender,
    };
  }

}