class UserModel{
  String? name;
  String? email;
  String? uId;
  bool? isVerified;

  UserModel({
    this.name,
    this.email,
    this.uId,
    this.isVerified
  });
  UserModel.fromJson(Map<String,dynamic>json)
  {
    name=json['name'];
    email=json['email'];
    uId =json['uId'];
    isVerified=json['isVerified'];
  }

  Map<String,dynamic>? toMap()
  {
    return
      {
        'name'  : name,
        'email' : email,
        'uId' : uId,
        'isVerified':isVerified,
      };

  }

}