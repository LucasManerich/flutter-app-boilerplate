import 'package:flutter/material.dart';
import 'package:flutter_app_boilerplate/stores/app.store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    AppStore store = GetIt.I.get<AppStore>();
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Home View'),
      ),
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Observer(
                builder: (context) {
                  return Text(store.userEmail);
                },
              ),
              Observer(
                builder: (context) {
                  return Text(store.userName);
                },
              )
            ],
          ),
        )
      ),
    );
  }
}