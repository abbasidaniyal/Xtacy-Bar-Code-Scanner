import 'package:flutter/material.dart';

import '../scoped_model/scannedValue.dart';
import 'package:scoped_model/scoped_model.dart';

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MainModel model = ScopedModel.of(context);
    print("Success");
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Image.asset("assets/success.gif"),
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              "Success!",
              textScaleFactor: 2,
            ),
          ),
          Container(
            padding: EdgeInsets.all(4.0),
            child: Text(
              "Welcome to xtacy",
              textScaleFactor: 1.5,
            ),
          ),
          Container(
            padding: EdgeInsets.all(2.0),
            child: Text("Your booking ID : " + model.registrationID),
          ),
          Container(
            margin: EdgeInsets.all(7.0),
            child: model.registrationID.contains("GOLD")?Text("Do collect your gold passes!",textScaleFactor: 2,):Text(""),
          )
        ],
      ),
    );
  }
}
