import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/patientView/Services/others/mainColor.dart';

class doctorHomeWidget extends StatelessWidget {
  doctorHomeWidget({super.key, required this.iconWidget, required this.txt});
  final iconWidget;
  String txt;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: const Color.fromARGB(66, 94, 94, 94)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconWidget,
            size: 50,
            color: mainColor(),
          ),
          Text(
            txt,
            style: TextStyle(
                color: mainColor(), fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }
}
