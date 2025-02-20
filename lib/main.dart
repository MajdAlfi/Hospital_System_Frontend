import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/doctorView/Screens/Home/doctorView.dart';
import 'package:hospital_app_frontend/doctorView/Screens/Patient/searchPatient.dart';
import 'package:hospital_app_frontend/doctorView/Screens/Patient/widgets/viewPatient.dart';
import 'package:hospital_app_frontend/doctorView/Screens/diagnosis/createDiagnosis.dart';
import 'package:hospital_app_frontend/doctorView/Screens/diagnosis/listOfDiagnosis.dart';
import 'package:hospital_app_frontend/doctorView/Screens/diagnosis/searchDiagnosis.dart';
import 'package:hospital_app_frontend/doctorView/Screens/diagnosis/selectPatientDiagnosis.dart';
import 'package:hospital_app_frontend/doctorView/Screens/diagnosis/viewDIagnosis.dart';
import 'package:hospital_app_frontend/HomeScr.dart';
import 'package:hospital_app_frontend/patientView/Services/others/dataProvider.dart';
import 'package:hospital_app_frontend/patientView/Services/others/mainFunc.dart';
import 'package:hospital_app_frontend/patientView/Screens/Auth/Welcome.dart';
import 'package:hospital_app_frontend/patientView/Screens/Auth/loginPage.dart';
import 'package:hospital_app_frontend/patientView/Screens/Auth/registerPage.dart';
import 'package:hospital_app_frontend/patientView/Screens/Home/home.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Widget home = await mainFunc();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => dataProvider()),
    ],
    child: HomeScr(
      home: home,
    ),
  ));
}
