import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './home_page.dart';
import './arrival_log.dart';

import 'package:scoped_model/scoped_model.dart';
import '../scoped_model/scannedValue.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.only(left: 20.0),
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            ListTile(
              title: Text(
                'Home',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Arrival Log',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              onTap: () {
                MainModel model = ScopedModel.of(context);
                model.getHistory().then((s) {
                  Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => ArrivalLog(),
                    ),
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
