import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/patientView/Services/others/screenSize.dart';
import 'package:hospital_app_frontend/patientView/Screens/Report/widgets/reportWidget.dart';

class reportHome extends StatelessWidget {
  const reportHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
              height: heightScr(context) * 0.8,
              width: widthScr(context) * 0.9,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
                itemBuilder: (context, index) => reportWidget(),
                itemCount: 10,
              )),
        ));
  }
}
