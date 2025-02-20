import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/patientView/Services/others/mainColor.dart';
import 'package:hospital_app_frontend/patientView/Services/others/screenSize.dart';

class viewPatient extends StatelessWidget {
  viewPatient(
      {super.key,
      required this.Email,
      required this.Name,
      required this.address,
      required this.phoneNum});

  String Name;
  String Email;
  String address;
  int phoneNum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0, left: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: mainColor(),
                    size: 25,
                  )),
            ),
          ),
          SizedBox(
            height: heightScr(context) * 0.1,
          ),
          Container(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/profile.jpeg',
                  height: heightScr(context) * 0.2,
                  width: widthScr(context) * 0.5,
                  fit: BoxFit.cover,
                ),
                Text(
                  'Name: $Name',
                  style: TextStyle(
                      color: mainColor(),
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: heightScr(context) * 0.01,
                ),
                Text(
                  'Email: $Email',
                  style: TextStyle(
                      color: mainColor(),
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: heightScr(context) * 0.01,
                ),
                Text(
                  'Phone: $phoneNum',
                  style: TextStyle(
                      color: mainColor(),
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: heightScr(context) * 0.01,
                ),
                Text(
                  'address: $address',
                  style: TextStyle(
                      color: mainColor(),
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: heightScr(context) * 0.01,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
