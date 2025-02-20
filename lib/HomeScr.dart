import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/accountantView/Screens/Home/accountantView.dart';
import 'package:hospital_app_frontend/adminView/screens/Home/admin.dart';
import 'package:hospital_app_frontend/adminView/screens/adminHome.dart';
import 'package:hospital_app_frontend/doctorView/Screens/Home/doctorView.dart';
import 'package:hospital_app_frontend/doctorView/Screens/Patient/searchPatient.dart';
import 'package:hospital_app_frontend/doctorView/Screens/Patient/widgets/viewPatient.dart';
import 'package:hospital_app_frontend/doctorView/Screens/Report/selectPatientReport.dart';
import 'package:hospital_app_frontend/doctorView/Screens/diagnosis/createDiagnosis.dart';
import 'package:hospital_app_frontend/doctorView/Screens/diagnosis/listOfDiagnosis.dart';
import 'package:hospital_app_frontend/doctorView/Screens/diagnosis/searchDiagnosis.dart';
import 'package:hospital_app_frontend/doctorView/Screens/diagnosis/selectPatientDiagnosis.dart';
import 'package:hospital_app_frontend/doctorView/Screens/diagnosis/selectPatientUploadDIagnosis.dart';
import 'package:hospital_app_frontend/doctorView/Screens/diagnosis/viewDIagnosis.dart';
import 'package:hospital_app_frontend/patientView/Screens/Auth/Welcome.dart';
import 'package:hospital_app_frontend/patientView/Screens/Auth/loginPage.dart';
import 'package:hospital_app_frontend/patientView/Screens/Auth/registerPage.dart';
import 'package:hospital_app_frontend/patientView/Screens/Home/home.dart';

class HomeScr extends StatefulWidget {
  HomeScr({super.key, required this.home});
  final home;

  @override
  State<HomeScr> createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> with WidgetsBindingObserver {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hospital App",
      routes: {
        'Login': (context) => loginPage(),
        'register': (context) => registerPage(),
        'patientSearch': (context) => searchPatient(),
        'createDiagnosis': (context) => createDiagnosis(),
        // 'selectPatient': (context) => selectPatientDiagnosis(),
        'searchDiagnosis': (context) => searchDiagnosis(),
        'homePatient': (context) => homePatient(),
        'Welcome': (context) => welcomePage(),
        'doctorHome': (context) => doctorView(),
        'selectPatientForDiagnosis': (context) =>
            selectPatientUploadDiagnosis(),
        'selectPaitentReport': (context) => selectPatientReport(),
        'accountantView': (context) => accountantview(),
        'adminView': (context) => admin()
      },
      home: widget.home,
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Example: Refresh the UI
      setState(() {
        // Update your UI or perform any required operations.
      });
    }
  }
}
