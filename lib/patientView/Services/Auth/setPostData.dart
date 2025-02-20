import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/models/userModels/userData.dart';
import 'package:hospital_app_frontend/patientView/Services/others/baseUrl.dart';
import 'package:hospital_app_frontend/patientView/Services/others/dataProvider.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

setPostsData(BuildContext context) async {
  // final auth = FirebaseAuth.instance;
  // final databaseReference = FirebaseFirestore.instance;
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // final uid = prefs.get('uid');
  // DocumentSnapshot snapshot =
  //     await databaseReference.collection("Users").doc(uid.toString()).get();
  final prefs = await SharedPreferences.getInstance();

  String baseurl = '${baseUrl()}/api/userdata/user/data';
  final token = context.read<dataProvider>().Token;
  print('token: $token');
  final tokenDecoded = JwtDecoder.decode(token.toString());
  final url = Uri.parse(baseurl);
  print(url);
  print(tokenDecoded['user_id']);
  final getData = await http.get(url, headers: {
    "Content-Type": "application/json",
    "x-access-token": token.toString(),
    "uid": tokenDecoded['user_id']
  });
  if (getData.statusCode == 200) {
    final jsonDecodeData = json.decode(getData.body);
    print(getData.body);

    userData uData = userData(
        id: jsonDecodeData['_id'],
        Name: jsonDecodeData['Name'],
        phoneNum: jsonDecodeData['phoneNum'],
        Email: jsonDecodeData['Email'],
        Address1: jsonDecodeData['Address1'],
        accountType: jsonDecodeData['accountType'],
        amountLeftToPay:
            double.parse(jsonDecodeData['amountLeftToPay'].toString()),
        totalCost: double.parse(jsonDecodeData['totalCost'].toString()),
        dateCreated:
            DateTime.fromMicrosecondsSinceEpoch(jsonDecodeData['dateCreated']));

    await Provider.of<dataProvider>(context, listen: false)
        .changeUserData(uData);
  }
}
