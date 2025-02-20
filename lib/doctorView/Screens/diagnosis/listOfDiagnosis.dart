import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/doctorView/Screens/Patient/widgets/searchWidget.dart';
import 'package:hospital_app_frontend/doctorView/Services/DiagnosisServices/getDiagnosis.dart';
import 'package:hospital_app_frontend/doctorView/Screens/diagnosis/viewDIagnosis.dart';
import 'package:hospital_app_frontend/doctorView/Screens/diagnosis/widgets/diagnosisSelectWidget.dart';
import 'package:hospital_app_frontend/patientView/Services/others/mainColor.dart';
import 'package:hospital_app_frontend/patientView/Services/others/screenSize.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class listOfDiagnosis extends StatelessWidget {
  listOfDiagnosis({super.key, required this.patientID});
  String patientID;
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
                    size: 25,
                    color: mainColor(),
                  )),
            ),
          ),
          Text(
            'Select a Diagnosis',
            style: TextStyle(
                color: mainColor(), fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          FutureBuilder(
              future: getDiagnosis(context, patientID),
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
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          height: heightScr(context) * 0.7,
                          width: widthScr(context) * 0.9,
                          child: ListView.separated(
                            itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => viewDIagnosis(
                                              diagnosisID: snapshot.data[index]
                                                  ['_id'])));
                                },
                                child: diagnosisSelectWidget(
                                    dateDiagnosis: snapshot.data[index]['Date'],
                                    Disease: snapshot.data[index]['disease'],
                                    Classification: snapshot.data[index]
                                        ['classification'])),
                            separatorBuilder: (context, index) => SizedBox(
                              height: 10,
                            ),
                            itemCount: snapshot.data.length,
                          ),
                        ))
                    : Center(child: Text('No Diagnosis available'));
              })
        ],
      ),
    );
  }
}
