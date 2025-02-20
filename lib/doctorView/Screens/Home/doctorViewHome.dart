import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/doctorView/Screens/Home/widgets/doctorHomeWidget.dart';
import 'package:hospital_app_frontend/patientView/Services/others/dataProvider.dart';
import 'package:hospital_app_frontend/patientView/Services/others/mainColor.dart';
import 'package:hospital_app_frontend/patientView/Services/others/screenSize.dart';
import 'package:hospital_app_frontend/patientView/Screens/profile/profileHome.dart';
import 'package:provider/provider.dart';

class doctorViewHome extends StatelessWidget {
  doctorViewHome({super.key});
  List icn = [Icons.person, Icons.add, Icons.search, Icons.picture_as_pdf];
  List title = ["PATIENTS", "DIAGNOSIS", "DIAGNOSIS", "REPORT"];
  List navi = [
    'patientSearch',
    'createDiagnosis',
    'searchDiagnosis',
    'selectPaitentReport'
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(color: mainColor()),
          height: heightScr(context),
          width: widthScr(context),
          child: Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Doctor ${context.watch<dataProvider>().userdata.Name}'
                    .toUpperCase(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: heightScr(context) * 0.7,
            width: widthScr(context),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 10),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 200,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, navi.elementAt(index));
                  },
                  child: doctorHomeWidget(
                      iconWidget: icn.elementAt(index),
                      txt: title.elementAt(index)),
                ),
                itemCount: 4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
