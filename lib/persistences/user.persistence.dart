import 'package:flutter_app_boilerplate/models/user.model.dart';

class UserPersistence {
  
  Future<UserModel> verifyEmailAndPassword(String email, String password) async {
    // simular delay
    await Future.delayed(Duration(seconds: 3));
    if(email == 'lucas@test.com' && password == '1234') {
      return new UserModel.fromJson({'email': 'lucas@test.com', 'password': '1234', 'name': 'Lucas'});
    } else {
      throw new Exception('Usuário ou senha incorretos');
    }
  }
}