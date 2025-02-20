import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/patientView/Services/others/alert.dart';
import 'package:hospital_app_frontend/patientView/Services/others/baseUrl.dart';
import 'package:hospital_app_frontend/patientView/Services/others/dataProvider.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

Future createDiagnosisService(
    BuildContext context,
    String doctorID,
    String imgName,
    img,
    String patientID,
    String classification,
    String disease,
    String diagnosis,
    String conditions,
    bool docConfirmation) async {
  final url = Uri.parse('${baseUrl()}/api/doctor/uploadIMG');
  final token = context.read<dataProvider>().Token;
  final decoded = JwtDecoder.decode(token.toString());
  final encodedBody = json.encode({
    "imgName": imgName.toString(),
    "image": img,
    "patientID": patientID,
    "doctorID": doctorID,
    "classification": classification,
    "disease": disease,
    "diagnosis": diagnosis,
    "conditions": conditions,
    "docConfirmation": docConfirmation,
  });
  print(doctorID);
  final data = await http.post(url,
      headers: {
        'Content-Type': 'application/json',
        'uid': decoded['user_id'],
        'x-access-token': token.toString()
      },
      body: encodedBody);
  if (data.statusCode == 200) {
    showAlertDialog(context, 'Diagnosis Uploaded!');
    return data.statusCode;
  } else {
    showAlertDialog(context, 'Diagnosis fialed to uplaod\n${data.body}');
    return data.statusCode;
  }
}
