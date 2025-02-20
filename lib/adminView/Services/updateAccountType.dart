import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/patientView/Services/others/alert.dart';
import 'package:hospital_app_frontend/patientView/Services/others/baseUrl.dart';
import 'package:hospital_app_frontend/patientView/Services/others/dataProvider.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

updateAccountType(BuildContext context, String pID) async {
  final token = context.read<dataProvider>().Token;
  final jw = JwtDecoder.decode(token.toString());
  final url = Uri.parse('${baseUrl()}/api/user/updateAccType');
  final body = json.encode({
    "pID": pID,
  });
  final data = await http.put(url,
      headers: {
        'uid': jw['user_id'],
        'x-access-token': token.toString(),
        'Content-Type': 'application/json'
      },
      body: body);
  if (data.statusCode == 200) {
    showAlertDialog(context, "Done");
  } else {
    showAlertDialog(context, data.body);
  }
}
