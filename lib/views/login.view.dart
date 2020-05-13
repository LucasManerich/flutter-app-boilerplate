import 'package:flutter/material.dart';
import 'package:flutter_app_boilerplate/models/user.model.dart';
import 'package:flutter_app_boilerplate/stores/app.store.dart';
import 'package:flutter_app_boilerplate/view-models/login.viewmodel.dart';
import 'package:flutter_app_boilerplate/controllers/login.controller.dart';
import 'package:flutter_app_boilerplate/views/home.view.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  
  final LoginViewModel model = LoginViewModel();
  final LoginController controller = LoginController();

  /// Realiza o Login no APP 
  void doLogin(context) async {
    try {
      UserModel _userModel = await this.controller.auth(model);
      AppStore store = GetIt.I.get<AppStore>();
      store.setUserEmail(_userModel.email);
      store.setUserName(_userModel.name);

      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));
    } catch(e) {
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: Text('Opss..'),
          content: Text(e.message),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      });
    }
  }

  /// Retorna a Text Field
  Widget _getTextField({ String label, Function onChanged, Function onError, bool isPassword = false}) {
    return TextField(
      onChanged: onChanged,
      obscureText: isPassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
        errorText: onError()
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home View'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            children: <Widget>[
              Observer(
                builder: (_,) => _getTextField(
                  label: "E-mail", 
                  onChanged: model.changeEmail,
                  onError: model.validateEmail
                )
              ),
              SizedBox(height: 20),
              Observer(
                builder: (_,) => _getTextField(
                  label: "Senha", 
                  onChanged: model.changePassword,
                  onError: model.validatePassword,
                  isPassword: true
                ),
              ),
              SizedBox(height: 10),
              Observer(
                builder: (_,)  {
                  if(this.model.isLoading) {
                    return CircularProgressIndicator();
                  } else {
                    return RaisedButton(
                      onPressed: this.model.isFormValid ? () => this.doLogin(context) : null,
                      child: Text('Logar'),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}