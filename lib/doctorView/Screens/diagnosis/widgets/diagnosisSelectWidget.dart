import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/patientView/Services/others/mainColor.dart';
import 'package:hospital_app_frontend/patientView/Services/others/screenSize.dart';

class diagnosisSelectWidget extends StatelessWidget {
  diagnosisSelectWidget(
      {super.key,
      required this.dateDiagnosis,
      required this.Classification,
      required this.Disease});
  String dateDiagnosis;
  String Disease;
  String Classification;
  @override
  Widget build(BuildContext context) {
    final diagDate = DateTime.parse(dateDiagnosis);
    return Container(
      height: heightScr(context) * 0.08,
      width: widthScr(context) * 0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: const Color.fromARGB(66, 94, 94, 94)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${Classification} || ${Disease} || ${diagDate.year}-${diagDate.month}-${diagDate.day}',
            style: TextStyle(
                color: mainColor(), fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
