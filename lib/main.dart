import 'package:flutter/material.dart';
import 'package:gasolinera_puma/login.dart';
import 'package:gasolinera_puma/register.dart';
import 'SQL/db.dart';

BuildContext? Contextos;
void main(){
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});


  @override
  Widget build(BuildContext context) {
    Contextos = context;
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => new Login(),
        '/register': (BuildContext context) => new Register(),
      },
      title: 'Gasolinera Puma',
      home: Login(),
    );
  }
}
