import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/models/userModels/userData.dart';
import 'package:hospital_app_frontend/patientView/Services/Auth/getToken.dart';
import 'package:hospital_app_frontend/patientView/Services/others/alert.dart';
import 'package:hospital_app_frontend/patientView/Services/others/baseUrl.dart';
import 'package:hospital_app_frontend/patientView/Services/others/dataProvider.dart';
import 'package:hospital_app_frontend/patientView/Services/others/delayPushU.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

register(String Email, String Password, String Name, int phoneNum,
    String Address1, BuildContext context) async {
  final SPreferences = await SharedPreferences.getInstance();

  userData uData = userData(
    Email: Email,
    Name: Name,
    phoneNum: phoneNum,
    Address1: Address1,
    accountType: 'Patient',
  );
  final url = Uri.parse('${baseUrl()}/api/auth/register/createUser');
  try {
    var encodedBody = json.encode(<String, dynamic>{
      "Email": uData.Email,
      "password": Password,
      "Address1": uData.Address1,
      "Name": uData.Name,
      "accountType": uData.accountType,
      "phoneNum": uData.phoneNum,
    });
    var postData = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: encodedBody);
    if (postData.statusCode == 201) {
      print('we Gucci');
      await SPreferences.setString('userToken', postData.body);
      SPreferences.setString('Password', Password);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isGuest', false);

      await getToken(context);
      showAlertLoading(context);
      if (postData.statusCode == 201) {
        Navigator.pop(context);
        delayPushU(context, 'homePatient');
      }
    } else {
      Navigator.pop(context);
      showAlertDialog(context, postData.body);
      print('error :(${postData.body}');
    }
  } catch (e) {
    print(e.toString());
  }
}
