import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/accountantView/Screens/Home/accountantView.dart';
import 'package:hospital_app_frontend/adminView/screens/Home/admin.dart';
import 'package:hospital_app_frontend/adminView/screens/adminHome.dart';
import 'package:hospital_app_frontend/doctorView/Screens/Home/doctorView.dart';
import 'package:hospital_app_frontend/patientView/Services/others/LoadingScr.dart';
import 'package:hospital_app_frontend/patientView/Services/others/alert.dart';
import 'package:hospital_app_frontend/patientView/Screens/Auth/Welcome.dart';
import 'package:hospital_app_frontend/patientView/Screens/Home/home.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Widget> mainFunc() async {
  late Widget Home;

  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool userStatus = prefs.containsKey('userToken');

  final isNew = prefs.getString('Password');

  if (isNew == null) {
    Home = const welcomePage();
  } else {
    if (userStatus == true) {
      final userToken = prefs.getString('userToken');
      Map<String, dynamic> tokenDecode = JwtDecoder.decode(userToken!);
      if (JwtDecoder.isExpired(userToken) == false) {
        if (tokenDecode['accountType'] == 'Patient') {
          Home = homePatient();
        } else if (tokenDecode['accountType'] == 'Doctor') {
          Home = doctorView();
        } else if (tokenDecode['accountType'] == 'accountant') {
          Home = accountantview();
        } else if (tokenDecode['accountType'] == 'admin') {
          Home = admin();
        } else {
          Home = welcomePage();
        }
      } else {
        Home = loadingScr();
      }
    } else {
      Home = welcomePage();
    }
  }
  return Home;
}
