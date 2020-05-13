import 'package:flutter_app_boilerplate/models/user.model.dart';
import 'package:flutter_app_boilerplate/persistences/user.persistence.dart';
import 'package:flutter_app_boilerplate/view-models/login.viewmodel.dart';

class LoginController {

  final UserPersistence _userPersistence = new UserPersistence();

  Future<UserModel> auth(LoginViewModel model) async {
    model.startLoading();
    try {
      UserModel _userModel = await this._userPersistence.verifyEmailAndPassword(model.email, model.password);
      model.stopLoading();
      return _userModel;
    } catch(e) {
      model.stopLoading(); 
      throw e;
    }
  }
}