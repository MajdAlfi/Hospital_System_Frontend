import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/patientView/Services/others/mainColor.dart';
import 'package:hospital_app_frontend/patientView/Services/others/screenSize.dart';

class reportSelectWidget extends StatelessWidget {
  reportSelectWidget({super.key, required this.dateReport});
  String dateReport;
  @override
  Widget build(BuildContext context) {
    final diagDate = DateTime.parse(dateReport);
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
            '${diagDate.year}-${diagDate.month}-${diagDate.day} || ${diagDate.hour}:${diagDate.minute}',
            style: TextStyle(
                color: mainColor(), fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ],
      ),
    );
  }
}
