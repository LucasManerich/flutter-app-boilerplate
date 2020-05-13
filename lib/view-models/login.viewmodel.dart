import 'package:mobx/mobx.dart';
part 'login.viewmodel.g.dart';

class LoginViewModel = _LoginViewModel with _$LoginViewModel;

abstract class _LoginViewModel with Store {
  
  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  bool isLoading = false;

  @action
  changeEmail(String newEmail) => this.email = newEmail;

  @action
  changePassword(String newPassword) => this.password = newPassword;

  @action
  startLoading() => this.isLoading = true;

  @action
  stopLoading() => this.isLoading = false;

  @computed
  bool get isFormValid => this.validateEmail() == null && this.validatePassword() == null;

  String validatePassword() {
    if(this.password.length == 0) {
      return 'Senha é obrigatório';
    }
    if(this.password.length > 0 && this.password.length < 4) {
      return 'A senha deverá conter ao menos 4 caracteres';
    }
    return null;
  }

  String validateEmail() {
    if(this.email.length == 0) {
      return 'E-mail é obrigatório';
    }
    if(this.email.contains('@') == false) {
      return 'E-mail inválido';
    }
    return null;
  }
}