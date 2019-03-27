import 'package:flutter/material.dart';
import './pages/welcome_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        accentColor: Color.fromRGBO(28, 28, 28, 1.0),
      ),
      home: WelcomePage(),
      
    );
  }
}
