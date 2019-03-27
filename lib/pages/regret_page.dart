import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_model/scannedValue.dart';

class ErrorPage extends StatelessWidget {
  String errorText;

  @override
  Widget build(BuildContext context) {
    MainModel model = ScopedModel.of(context);
    print("regret");
    print(errorText);
    return Scaffold(
      appBar: AppBar(
        title: Text("Unsuccessful"),
      ),
      body: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.all(20.0),
              child: Image.asset("assets/regret.png")),
          Text("Something went wrong", textScaleFactor: 1.7,),
          model.error.isNotEmpty ? Text(model.error,textScaleFactor: 1.5,) : Text("")
        ],
      ),
    );
  }
}
