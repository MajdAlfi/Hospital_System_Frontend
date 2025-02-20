import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/patientView/Services/others/alert.dart';
import 'package:hospital_app_frontend/patientView/Services/others/baseUrl.dart';
import 'package:hospital_app_frontend/patientView/Services/others/dataProvider.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

Future getReportData(BuildContext context, String diagnosisID) async {
  final url = Uri.parse('${baseUrl()}/api/report/getReportData/$diagnosisID');
  final token = context.read<dataProvider>().Token;
  final tokenDecoded = JwtDecoder.decode(token);

  final data = await http.get(url, headers: {
    'Content-Type': 'application/json',
    'uid': tokenDecoded['user_id'],
    'x-access-token': token.toString(),
  });

  if (data.statusCode == 200) {
    final decode = json.decode(data.body);
    return decode;
  } else {
    showAlertDialog(context, 'No data Available,\n${data.body}');
    return [];
  }
}
