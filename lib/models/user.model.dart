class UserModel {
  
  UserModel({
    this.name,
    this.email,
    this.password
  });

  String name;
  String email;
  String password;
  
  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      name     : json['name'],
      email    : json['email'],
      password : json['password']
    );
  }
}