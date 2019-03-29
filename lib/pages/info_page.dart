import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../scoped_model/scannedValue.dart';

class InfoPage extends StatelessWidget {
  int index;
  InfoPage(this.index);

  @override
  Widget build(BuildContext context) {
    MainModel model = ScopedModel.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ListView.builder(
          itemCount: model.history[index].length,
          itemBuilder: (context, int indexx) {
            return Container(
              padding: EdgeInsets.all(2.0),
              margin: EdgeInsets.all(2.0),
              child: Text(model.history[indexx].keys.elementAt(indexx) +
                  " : " +
                  model.history[index][
                      model.history[indexx].keys.elementAt(indexx).toString()]),
            );
          },
        ),
      ),
    );
  }
}
