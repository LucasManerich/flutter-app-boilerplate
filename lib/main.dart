import 'package:flutter/material.dart';
import 'package:flutter_app_boilerplate/stores/app.store.dart';
import 'package:flutter_app_boilerplate/views/login.view.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerSingleton(AppStore());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginView(),
    );
  }
}