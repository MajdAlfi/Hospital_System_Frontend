import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/doctorView/Screens/Patient/widgets/searchWidget.dart';
import 'package:hospital_app_frontend/doctorView/Screens/Report/widgets/reportSelectWidget.dart';
import 'package:hospital_app_frontend/doctorView/Services/DiagnosisServices/getDiagnosis.dart';
import 'package:hospital_app_frontend/doctorView/Services/ReportServices/getReportPatient.dart';
import 'package:hospital_app_frontend/doctorView/Screens/diagnosis/viewDIagnosis.dart';
import 'package:hospital_app_frontend/doctorView/Screens/diagnosis/widgets/diagnosisSelectWidget.dart';
import 'package:hospital_app_frontend/patientView/Services/Auth/isJwtExpired.dart';
import 'package:hospital_app_frontend/patientView/Services/others/baseUrlIMG.dart';
import 'package:hospital_app_frontend/patientView/Services/others/dataProvider.dart';
import 'package:hospital_app_frontend/patientView/Services/others/mainColor.dart';
import 'package:hospital_app_frontend/patientView/Services/others/screenSize.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class listOfReports extends StatelessWidget {
  listOfReports({super.key, required this.patientID});
  String patientID;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          (context.read<dataProvider>().userdata.accountType == 'Doctor')
              ? Padding(
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
                )
              : SizedBox(
                  height: 80,
                ),
          Text(
            'Select a Report',
            style: TextStyle(
                color: mainColor(), fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          FutureBuilder(
              future: getReportPatient(patientID, context),
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
                    ? (snapshot.data.length == 0)
                        ? const Center(
                            child: Text(
                              'No Report to show',
                            ),
                          )
                        : Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              height: heightScr(context) * 0.7,
                              width: widthScr(context) * 0.9,
                              child: ListView.separated(
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                        onTap: () {
                                          final string =
                                              '${baseUrlIMG()}${snapshot.data[index]['pdfUrl']}';

                                          final url = Uri.parse(string);
                                          print(string);
                                          print(url);
                                          print(baseUrlIMG());
                                          print(snapshot.data[index]['pdfUrl']);
                                          launchUrl(url);
                                        },
                                        child: reportSelectWidget(
                                            dateReport: snapshot.data[index]
                                                ['date'])),
                                separatorBuilder: (context, index) => SizedBox(
                                  height: 10,
                                ),
                                itemCount: snapshot.data.length,
                              ),
                            ))
                    : Center(child: Text('No Report available'));
              })
        ],
      ),
    );
  }
}
