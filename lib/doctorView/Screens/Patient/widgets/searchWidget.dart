import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/models/userModels/userData.dart';
import 'package:hospital_app_frontend/patientView/Services/others/mainColor.dart';
import 'package:hospital_app_frontend/patientView/Services/others/screenSize.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({super.key, required this.pName, required this.phoneNum});
  String pName;
  int phoneNum;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightScr(context) * 0.08,
      width: widthScr(context) * 0.8,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Color.fromARGB(66, 94, 94, 94)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            pName,
            style: TextStyle(
                color: mainColor(), fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Text(
            phoneNum.toString(),
            style: TextStyle(
                color: mainColor(), fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
