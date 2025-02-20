import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/doctorView/Screens/Report/generateReport.dart';
import 'package:hospital_app_frontend/doctorView/Services/DiagnosisServices/getDiagnosisDetails.dart';
import 'package:hospital_app_frontend/doctorView/Services/ReportServices/getReportData.dart';
import 'package:hospital_app_frontend/doctorView/Screens/diagnosis/viewImageDiag.dart';
import 'package:hospital_app_frontend/patientView/Services/Auth/isJwtExpired.dart';
import 'package:hospital_app_frontend/patientView/Services/others/baseUrlIMG.dart';
import 'package:hospital_app_frontend/patientView/Services/others/dataProvider.dart';
import 'package:hospital_app_frontend/patientView/Services/others/mainColor.dart';
import 'package:hospital_app_frontend/patientView/Services/others/screenSize.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class viewDIagnosis extends StatelessWidget {
  viewDIagnosis({super.key, required this.diagnosisID});
  String diagnosisID;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getDiagnosisDetails(context, diagnosisID),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
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
                ? SingleChildScrollView(
                    child: Column(
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
                                  size: 25,
                                  color: mainColor(),
                                )),
                          ),
                        ),
                        Container(
                          height: heightScr(context) * 0.8,
                          width: widthScr(context) * 0.9,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                              color: greyColor()),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: heightScr(context) * 0.01,
                              ),
                              Image.asset(
                                'assets/images/diagnosis.png',
                                height: heightScr(context) * 0.05,
                                width: widthScr(context) * 0.1,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                height: heightScr(context) * 0.01,
                              ),
                              Text(
                                'DR.${snapshot.data[1]}',
                                style: TextStyle(
                                    color: mainColor(),
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: heightScr(context) * 0.02,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: heightScr(context) * 0.02,
                                      ),
                                      Text(
                                        '${snapshot.data[2]}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        '${snapshot.data[0]['classification']}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: widthScr(context) * 0.1,
                                  ),
                                  ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => viewImageDiag(
                                                    imgUrl:
                                                        '${baseUrlIMG()}${snapshot.data[3]}')));
                                      },
                                      child: Image.network(
                                        '${baseUrlIMG()}${snapshot.data[3]}',
                                        height: heightScr(context) * 0.15,
                                        width: widthScr(context) * 0.3,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: heightScr(context) * 0.02,
                              ),
                              Container(
                                height: heightScr(context) * 0.4,
                                width: widthScr(context) * 0.8,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                    color: greyColor()),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: heightScr(context) * 0.01,
                                    ),
                                    Text(
                                      '${snapshot.data[0]['disease']}',
                                      style: TextStyle(
                                          color: mainColor(),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: heightScr(context) * 0.01,
                                    ),
                                    SizedBox(
                                        height: heightScr(context) * 0.2,
                                        width: widthScr(context) * 0.7,
                                        child: Text(
                                          textAlign: TextAlign.left,
                                          '${snapshot.data[0]['diagnosis']}',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15),
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: heightScr(context) * 0.01,
                              ),
                              if (context
                                      .read<dataProvider>()
                                      .userdata
                                      .accountType ==
                                  'Doctor')
                                Container(
                                  height: heightScr(context) * 0.06,
                                  width: widthScr(context) * 0.8,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(30),
                                      ),
                                      color: mainColor()),
                                  child: TextButton(
                                      onPressed: () async {
                                        print(snapshot.data[0]['patientID']);
                                        final dataReport = await getReportData(
                                            context, diagnosisID);
                                        final GenerateData =
                                            await generateReport(
                                                context, dataReport);
                                        await savePDF(
                                            "report_$diagnosisID.pdf",
                                            GenerateData,
                                            context,
                                            snapshot.data[0]['patientID'],
                                            diagnosisID);
                                      },
                                      child: const Text(
                                        'Generate Report',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                : const Center(
                    child: Text('No Data to Show'),
                  );
          }),
    );
  }
}
