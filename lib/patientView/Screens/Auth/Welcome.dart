import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/patientView/Services/others/mainColor.dart';
import 'package:hospital_app_frontend/patientView/Services/others/screenSize.dart';

class welcomePage extends StatelessWidget {
  const welcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: widthScr(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/hospital.png',
              width: widthScr(context) * 0.5,
              height: widthScr(context) * 0.5,
              fit: BoxFit.cover,
            ),
            Text(
              'WELCOME',
              style: TextStyle(
                  color: mainColor(),
                  fontWeight: FontWeight.bold,
                  fontSize: 35),
            ),
            SizedBox(
              height: heightScr(context) * 0.3,
            ),
            Container(
              width: widthScr(context) * 0.9,
              height: heightScr(context) * 0.06,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: mainColor(),
              ),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'Login');
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: widthScr(context) * 0.9,
              height: heightScr(context) * 0.06,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: mainColor()),
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.white,
              ),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'register');
                  },
                  child: Text(
                    'SignUp',
                    style: TextStyle(
                        color: mainColor(),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
