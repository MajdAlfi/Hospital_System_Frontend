import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/patientView/Services/others/dataProvider.dart';
import 'package:hospital_app_frontend/patientView/Services/others/mainColor.dart';
import 'package:hospital_app_frontend/patientView/Services/others/screenSize.dart';
import 'package:hospital_app_frontend/patientView/Services/others/signout.dart';
import 'package:provider/provider.dart';

class profileHome extends StatelessWidget {
  const profileHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: heightScr(context),
            width: widthScr(context),
            color: mainColor(),
            child: Padding(
              padding: const EdgeInsets.only(top: 110.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "PROFILE",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.white),
              height: heightScr(context) * 0.65,
              width: widthScr(context),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: heightScr(context) * 0.05,
                    ),
                    Center(
                      child: Image.asset('assets/images/profile.webp',
                          height: heightScr(context) * 0.25,
                          width: widthScr(context) * 0.5,
                          fit: BoxFit.cover),
                    ),
                    SizedBox(
                      height: heightScr(context) * 0.05,
                    ),
                    Text(
                      "Name: ${context.read<dataProvider>().userdata.Name}"
                          .toUpperCase(),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: heightScr(context) * 0.01,
                    ),
                    Text(
                      "email: ${context.read<dataProvider>().userdata.Email}"
                          .toUpperCase(),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: heightScr(context) * 0.01,
                    ),
                    Text(
                      "address: ${context.read<dataProvider>().userdata.Address1}"
                          .toUpperCase(),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: heightScr(context) * 0.01,
                    ),
                    Text(
                      "account type: ${context.read<dataProvider>().userdata.accountType}"
                          .toUpperCase(),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: heightScr(context) * 0.05,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      height: heightScr(context) * 0.06,
                      width: widthScr(context) * 0.9,
                      child: TextButton(
                        onPressed: () {
                          signoutFunc(context);
                        },
                        child: Text(
                          'SignOut',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
