import 'package:flutter/material.dart';
import './pages/welcome_page.dart';
import 'package:scoped_model/scoped_model.dart';

import './scoped_model/scannedValue.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: MainModel(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.black,
          accentColor: Color.fromRGBO(28, 28, 28, 1.0),
        ),
        home: WelcomePage(),
      ),
    );
  }
}
