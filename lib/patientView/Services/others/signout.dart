import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/models/userModels/userData.dart';
import 'package:hospital_app_frontend/patientView/Services/others/dataProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

signoutFunc(BuildContext context) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.remove('Password');
  pref.remove('userToken');
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
  await Provider.of<dataProvider>(context, listen: false).changeToken('');
  await Provider.of<dataProvider>(context, listen: false)
      .changeUserData(userdata);
  Navigator.pushReplacementNamed(context, 'Welcome');
}
