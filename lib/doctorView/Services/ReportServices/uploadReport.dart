import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hospital_app_frontend/patientView/Services/others/alert.dart';
import 'package:hospital_app_frontend/patientView/Services/others/baseUrl.dart';
import 'package:hospital_app_frontend/patientView/Services/others/dataProvider.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

Future uploadReport(BuildContext context, file, String fileName,
    String PatientID, String dID) async {
  final token = context.read<dataProvider>().Token;
  final jw = JwtDecoder.decode(token.toString());
  final url = Uri.parse('${baseUrl()}/api/report/upload');
  final body = json.encode({
    "file": file,
    "fileName": fileName,
    "patientID": PatientID,
    "diagnosisID": dID
  });
  final data = await http.post(url,
      headers: {
        'uid': jw['user_id'],
        'x-access-token': token.toString(),
        'Content-Type': 'application/json'
      },
      body: body);
  if (data.statusCode == 200) {
    return data.body;
  } else if (data.statusCode == 201) {
  } else {
    showAlertDialog(context, data.body);
  }
}
