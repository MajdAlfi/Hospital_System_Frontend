import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/patientView/Services/Auth/setPostData.dart';
import 'package:hospital_app_frontend/patientView/Services/others/alert.dart';
import 'package:hospital_app_frontend/patientView/Services/others/baseUrl.dart';
import 'package:hospital_app_frontend/patientView/Services/others/dataProvider.dart';
import 'package:hospital_app_frontend/patientView/Services/others/delayPushU.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

loginFunc(BuildContext context, String email, String Pass) async {
  RegExp emailRegExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  if (email == '' || Pass == '') {
    Navigator.pop(context);
    showAlertDialog(context, "Please fill in the fields");
  } else if (!emailRegExp.hasMatch(email)) {
    Navigator.pop(context);
    showAlertDialog(context, "Enter a valid Email");
  } else {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final url = Uri.parse('${baseUrl()}/api/auth/login/');

    try {
      // final messaging = FirebaseMessaging.instance;
      // final fcmToken = await messaging.getToken();
      // print(fcmToken);
      var encodedBody = json.encode(<String, dynamic>{
        "Email": email,
        "password": Pass,
        //fcmToken.toString()
      });
      var postData = await http.post(url,
          headers: {"Content-Type": "application/json"}, body: encodedBody);
      if (postData.statusCode == 201) {
        //    print('fcmtToken: $fcmToken');
        print('we Gucci');
        await prefs.setString('userToken', postData.body);
        prefs.setString('Password', Pass);
        print('PostBody: ${postData.body}');
        Provider.of<dataProvider>(context, listen: false)
            .changeToken(postData.body);
        final accountType = JwtDecoder.decode(postData.body);

        await setPostsData(context);
        Navigator.pop(context);
        if (accountType['accountType'] == 'Patient') {
          Navigator.pushReplacementNamed(context, 'homePatient');
        } else if (accountType['accountType'] == 'Doctor') {
          Navigator.pushReplacementNamed(context, 'doctorHome');
        } else if (accountType['accountType'] == 'accountant') {
          Navigator.pushReplacementNamed(context, 'accountantView');
        } else if (accountType['accountType'] == 'admin') {
          Navigator.pushReplacementNamed(context, 'adminView');
        } else {
          showAlertDialog(context, 'Account Type invalid');
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
}
