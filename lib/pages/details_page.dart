import 'package:flutter/material.dart';
import '../scoped_model/scannedValue.dart';
import 'package:scoped_model/scoped_model.dart';

class Details extends StatelessWidget {
  Map<String, dynamic> array = {};
  final int index;
  Details({this.index});

  @override
  Widget build(BuildContext context) {
    MainModel model = ScopedModel.of(context);
    array = model.history[index];
    print(array);
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: array.keys.length,
        itemBuilder: (BuildContext context, int indexx) {
          return Text(array.keys.elementAt(indexx) +
              " : " +
              array.values.elementAt(indexx).toString());
        },
      ),
    );
  }
}
