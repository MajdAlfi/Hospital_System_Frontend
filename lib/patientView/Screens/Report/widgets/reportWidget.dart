import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/patientView/Services/others/screenSize.dart';

class reportWidget extends StatelessWidget {
  const reportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightScr(context) * 0.1,
      width: widthScr(context) * 0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: const Color.fromARGB(68, 69, 69, 69),
      ),
    );
  }
}
