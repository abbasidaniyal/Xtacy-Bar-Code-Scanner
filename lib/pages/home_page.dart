import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  String result;
  Future scanCode() async {
    try {
      String code = await BarcodeScanner.scan();
      setState(() {
        result = code;
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Permission Denied";
        });
      } else {
        setState(() {
          result = "Unknown Error";
        });
      }
    } on FormatException catch (e) {
      setState(() {
        result = 'Unexected Action';
      });
    } catch (a) {
      setState(() {
        result = 'Unknown';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('xtacy'),
          backgroundColor: Color.fromRGBO(255,216,0,1.0)
          ),
      floatingActionButton: FloatingActionButton(
        child: Center(
          child: Icon(Icons.camera),
          
        ),
        onPressed: scanCode,
      ),
      body: result!=null ?Text(result): Text(""),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
