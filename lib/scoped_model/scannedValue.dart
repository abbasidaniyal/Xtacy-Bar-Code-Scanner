import 'package:scoped_model/scoped_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/scannedCode.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class MainModel extends Model {
  Map<String, dynamic> data;
  String error = 'ERROR';
  String registrationID;
  List<Map<String, dynamic>> history = [];

  bool verify(String registrationNumber, String hashedRegistrationNumber) {
    
    var data = utf8.encode(registrationNumber);
    var hash = md5.convert(data);
    if (hash.toString().contains(hashedRegistrationNumber)) {
      print("STRING HASH MATCHED");
      return true;
    } else {
      print("String hash not matched");
      return true;
    }
  }

  Future<bool> getDataStatus(String registrationNumber) async {
    bool status;
    await Firestore.instance
        .collection("registrations")
        .where("rgnId", isEqualTo: registrationNumber)
        .getDocuments()
        .then(
      (QuerySnapshot snapshot) {
        data = snapshot.documents[0].data;
        if (snapshot.documents[0].data.containsKey("hasArrived") &&
            snapshot.documents[0].data["hasArrived"] == true) {
          error = "Already Entered";
          print("ALREADY ENTERED");
          status = false;
          notifyListeners();
        } else {
          Firestore.instance
              .collection("registrations")
              .document(registrationNumber.toUpperCase())
              .updateData({"hasArrived": true});

          Firestore.instance.collection("arrivals").add(data);
          registrationID = registrationNumber;
          print("Welcome to xtacy");
          status = true;
          notifyListeners();
        }
      },
    ).catchError(
      (e) {
        error = "Invalid Code";
        print("Not Registered");

        status = false;
        notifyListeners();
      },
    );
    print(status);
    return status;
  }

  Future<Null> getHistory() async {
    await Firestore.instance
        .collection("arrivals")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      for (DocumentSnapshot doc in snapshot.documents) {
        history.add(doc.data);
      }

      print(history);
    });
  }
}
