import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/accountantView/Screens/Payments/widgets/paymentWidget.dart';
import 'package:hospital_app_frontend/accountantView/Services/getPatientPayments.dart';
import 'package:hospital_app_frontend/patientView/Services/others/mainColor.dart';
import 'package:hospital_app_frontend/patientView/Services/others/screenSize.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class patientPayments extends StatefulWidget {
  patientPayments({super.key, required this.pID});
  String pID;
  @override
  State<patientPayments> createState() => _patientPaymentsState();
}

class _patientPaymentsState extends State<patientPayments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: heightScr(context),
        width: widthScr(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: heightScr(context) * 0.85,
                width: widthScr(context) * 0.9,
                child: RefreshIndicator(
                  onRefresh: () {
                    return onRefresh();
                  },
                  child: FutureBuilder(
                      future: getPatientPayments(context, widget.pID),
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
                            ? ListView.separated(
                                itemBuilder: (context, index) => paymentWidget(
                                      amount: snapshot.data[index]['Cost'],
                                      date: DateTime.parse(
                                          snapshot.data[index]['date']),
                                      isPaid: snapshot.data[index]['isPaid'],
                                      desc: snapshot.data[index]['desc'],
                                      fID: snapshot.data[index]['_id'],
                                      pID: widget.pID,
                                    ),
                                separatorBuilder: (context, index) => SizedBox(
                                      height: 5,
                                    ),
                                itemCount: snapshot.data.length)
                            : Center(child: Text('No Payments available'));
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onRefresh() async {
    setState(() {});
  }
}
