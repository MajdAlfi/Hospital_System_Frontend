import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/models/userModels/userData.dart';

class dataProvider with ChangeNotifier {
  String Token = '';
  // user Data
  userData userdata = userData(
      id: '',
      Name: '',
      phoneNum: 0,
      totalCost: 0,
      amountLeftToPay: 0,
      Email: '',
      Address1: '',
      accountType: '',
      dateCreated: DateTime.now());
  String selectedPatientID = '';

  changeSelectedPatientID(String pID) {
    selectedPatientID = pID;
    notifyListeners();
  }

  changeToken(String tkn) {
    Token = tkn;
    notifyListeners();
  }

  changeUserData(userData user) {
    userdata = user;
    notifyListeners();
  }
}
