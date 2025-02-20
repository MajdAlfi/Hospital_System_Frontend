import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/patientView/Services/Auth/getToken.dart';
import 'package:hospital_app_frontend/patientView/Services/Auth/refreshToken.dart';
import 'package:hospital_app_frontend/patientView/Services/Auth/setPostData.dart';
import 'package:hospital_app_frontend/patientView/Services/others/dataProvider.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future isJwtExpired(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();

  if (context.read<dataProvider>().Token.isEmpty) {
    getToken(context).then((value) {
      setPostsData(context);
      // updateFcmToken(value);
    });
  } else if (context.read<dataProvider>().Token.isNotEmpty) {
    print(context.read<dataProvider>().Token);
    if (JwtDecoder.isExpired(context.read<dataProvider>().Token.toString()) ==
        true) {
      print('we are checking!');
      final pass = prefs.getString('Password');
      if (context.read<dataProvider>().userdata.Email != null && pass != null) {
        print('we are inn!');
        reefreshToken(
            context.read<dataProvider>().userdata.Email!, pass, context);

        //  updateFcmToken(context.read<dataProvider>().Token.toString());
      }
    } else {
      setPostsData(context);
      // updateFcmToken(context.read<dataProvider>().Token.toString());
    }
  }
}
