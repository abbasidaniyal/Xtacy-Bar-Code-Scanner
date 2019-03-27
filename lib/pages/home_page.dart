import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';

import '../scoped_model/scannedValue.dart';
import './success_page.dart';
import './regret_page.dart';
import './drawer.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  String result;
  String code;
  String regestrationNumber, hashedRegestrationNumber;
  bool isVerified;
  bool status;

  Future scanCode() async {
    try {
      MainModel model = ScopedModel.of(context);
      code = await BarcodeScanner.scan();
      setState(
        () {
          regestrationNumber = code.substring(0, 16);
          hashedRegestrationNumber = code.substring(16);

          print(" Code = " + regestrationNumber);
          print("Hashed Code = " + hashedRegestrationNumber);

          isVerified =
              model.verify(regestrationNumber, hashedRegestrationNumber);

          if (isVerified) {
            model.getDataStatus(regestrationNumber).then(
              (bool status) {
                if (status) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return SuccessPage();
                      },
                    ),
                  );
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return ErrorPage();
                      },
                    ),
                  );
                }
              },
            );
          } else {
            print("INVALID BARCODE");
          }
        },
      );
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
      drawer: MyDrawer( 
        ),
      appBar: AppBar(
        title: Text('xtacy'),
        // backgroundColor: Color.fromRGBO(255,216,0,1.0)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera),
        label: Text("Scan"),
        onPressed: scanCode,
      ),
      body: Center(
        child: Text(
          "Welcome to xtacy!",
          textScaleFactor: 1.5,
        ),
      ),
    );
  }
}
