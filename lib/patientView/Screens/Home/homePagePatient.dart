import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/doctorView/Services/DiagnosisServices/getDiagnosis.dart';
import 'package:hospital_app_frontend/doctorView/Services/DiagnosisServices/getDiagnosisDetails.dart';
import 'package:hospital_app_frontend/doctorView/Screens/diagnosis/viewDIagnosis.dart';
import 'package:hospital_app_frontend/patientView/Services/Auth/isJwtExpired.dart';
import 'package:hospital_app_frontend/patientView/Services/diagnosisServices/getNumberDIagnosis.dart';
import 'package:hospital_app_frontend/patientView/Services/diagnosisServices/getPatientDiagnosisDetails.dart';
import 'package:hospital_app_frontend/patientView/Services/others/dataProvider.dart';
import 'package:hospital_app_frontend/patientView/Services/others/mainColor.dart';
import 'package:hospital_app_frontend/patientView/Services/others/screenSize.dart';
import 'package:hospital_app_frontend/patientView/Screens/Home/widgets/gridHomeWidget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class homePagePatient extends StatefulWidget {
  const homePagePatient({super.key});

  @override
  State<homePagePatient> createState() => _homePagePatientState();
}

class _homePagePatientState extends State<homePagePatient>
    with WidgetsBindingObserver {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                color: mainColor(),
                height: heightScr(context),
                width: widthScr(context),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, right: 5),
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Opacity(
                              opacity: 0.1,
                              child: Image.asset(
                                'assets/images/heartbw.png',
                                height: heightScr(context) * 0.25,
                                width: widthScr(context) * 0.4,
                                fit: BoxFit.cover,
                              ))),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 80.0, left: 35),
                          child: Text(
                            '${context.watch<dataProvider>().userdata.Name}'
                                .toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 35),
                          ),
                        ),
                        FutureBuilder(
                            future: getNumberDiagnosis(context),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: SizedBox(
                                  height: widthScr(context) * 0.1,
                                  width: widthScr(context) * 0.1,
                                  child: LoadingAnimationWidget.flickr(
                                    leftDotColor: greyColor(),
                                    rightDotColor: mainColor(),
                                    size: 50,
                                  ),
                                ));
                              }
                              return (snapshot.hasData)
                                  ? Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        '${snapshot.data} Diagnosis'
                                            .toUpperCase(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 10),
                                      ),
                                    )
                                  : const Center(
                                      child: Text('No Diagnosis Found'),
                                    );
                            }),
                      ],
                    ),
                  ],
                ),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  color: Colors.white),
              height: heightScr(context) * 0.7,
              width: widthScr(context),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: FutureBuilder(
                    future: getPatientDiagnosisDetails(
                        context, context.read<dataProvider>().userdata.id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                            child: SizedBox(
                          height: widthScr(context) * 0.1,
                          width: widthScr(context) * 0.1,
                          child: LoadingAnimationWidget.flickr(
                            leftDotColor: greyColor(),
                            rightDotColor: mainColor(),
                            size: 50,
                          ),
                        ));
                      }
                      return (snapshot.hasData)
                          ? (snapshot.data[0].length == 0)
                              ? const Center(
                                  child: Text(
                                    'No Diagnosis to show',
                                  ),
                                )
                              : GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 0,
                                          mainAxisExtent: 200,
                                          mainAxisSpacing: 0),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    viewDIagnosis(
                                                        diagnosisID: snapshot
                                                                .data[0][index]
                                                            ['_id'])));
                                      },
                                      child: GridHomeWidget(
                                        imgUrl: snapshot.data[2][index],
                                        doctorName: snapshot.data[1][index],
                                        dateDiagnosis: DateTime.parse(snapshot
                                            .data[0][index]['Date']
                                            .toString()),
                                      ),
                                    );
                                  },
                                  itemCount: snapshot.data[0].length,
                                )
                          : const Center(
                              child: Text(
                                'No Diagnosis Reports to show',
                              ),
                            );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Example: Refresh the UI
      setState(() {
        // Update your UI or perform any required operations.
      });
    }
  }
}
