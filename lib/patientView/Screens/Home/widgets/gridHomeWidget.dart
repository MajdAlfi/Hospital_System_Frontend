import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/patientView/Services/others/baseUrlIMG.dart';
import 'package:hospital_app_frontend/patientView/Services/others/mainColor.dart';
import 'package:hospital_app_frontend/patientView/Services/others/screenSize.dart';

class GridHomeWidget extends StatelessWidget {
  GridHomeWidget(
      {super.key,
      required this.imgUrl,
      required this.doctorName,
      required this.dateDiagnosis});
  String imgUrl;
  String doctorName;
  DateTime dateDiagnosis;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: heightScr(context) * 0.1,
        width: widthScr(context) * 0.4,
        decoration: BoxDecoration(
            color: greyColor(),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: const Radius.circular(30),
                    topRight: Radius.circular(30)),
                child: Image.network(
                  '${baseUrlIMG()}$imgUrl',
                  fit: BoxFit.cover,
                  height: 110,
                  width: widthScr(context) * 0.5,
                )),
            Text(
              'DR. $doctorName',
              style: TextStyle(
                  color: mainColor(),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text(
              '${dateDiagnosis.year}-${dateDiagnosis.month}-${dateDiagnosis.day}',
              style: const TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.normal,
                  fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
