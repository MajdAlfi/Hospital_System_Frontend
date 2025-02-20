import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/patientView/Services/Auth/setPostData.dart';
import 'package:hospital_app_frontend/patientView/Services/others/baseUrl.dart';
import 'package:hospital_app_frontend/patientView/Services/others/dataProvider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future reefreshToken(String email, String Pass, BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  final url = Uri.parse('${baseUrl()}/api/auth/refresh');

  try {
    var encodedBody = json.encode(<String, dynamic>{
      "Email": email,
      "password": Pass,
    });
    var postData = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: encodedBody);
    if (postData.statusCode == 201) {
      print('we Gucci');
      await prefs.setString('userToken', postData.body);
      prefs.setString('Password', Pass);
      print('PostBody: ${postData.body}');
      Provider.of<dataProvider>(context, listen: false)
          .changeToken(postData.body);
      await setPostsData(context);
      return true;
    } else {
      print('error :(${postData.body}');
      return false;
    }
  } catch (e) {
    print(e.toString());
  }
}
