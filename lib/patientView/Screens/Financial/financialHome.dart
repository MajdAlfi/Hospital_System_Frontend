import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/accountantView/Screens/Payments/patientPayments.dart';
import 'package:hospital_app_frontend/patientView/Services/Auth/isJwtExpired.dart';
import 'package:hospital_app_frontend/patientView/Services/finentialSevices/getNumberTransactions.dart';
import 'package:hospital_app_frontend/patientView/Services/others/dataProvider.dart';
import 'package:hospital_app_frontend/patientView/Services/others/mainColor.dart';
import 'package:hospital_app_frontend/patientView/Services/others/screenSize.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class FinancialHome extends StatefulWidget {
  const FinancialHome({super.key});

  @override
  State<FinancialHome> createState() => _FinancialHomeState();
}

class _FinancialHomeState extends State<FinancialHome>
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
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.center,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(1, 1), spreadRadius: 1),
            ],
          ),
          height: heightScr(context) * 0.7,
          width: widthScr(context) * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: heightScr(context) * 0.15,
                width: widthScr(context) * 0.8,
                decoration: BoxDecoration(
                  color: mainColor(),
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                child: Center(
                  child: Text(
                    'Total Paid: ${context.read<dataProvider>().userdata.totalCost}£',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: heightScr(context) * 0.05,
              ),
              Container(
                height: heightScr(context) * 0.15,
                width: widthScr(context) * 0.8,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 91, 79),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Center(
                  child: Text(
                    'Left to Pay: ${context.read<dataProvider>().userdata.amountLeftToPay}£',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: heightScr(context) * 0.05,
              ),
              FutureBuilder(
                  future: getNumberTransactions(context),
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
                        ? GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => patientPayments(
                                          pID: context
                                              .read<dataProvider>()
                                              .userdata
                                              .id
                                              .toString())));
                            },
                            child: Container(
                              height: heightScr(context) * 0.15,
                              width: widthScr(context) * 0.8,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(67, 96, 96, 96),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              child: Center(
                                child: Text(
                                  'Total Transactions: ${snapshot.data}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ),
                            ),
                          )
                        : Center(child: Text('No Transactions Found'));
                  })
            ],
          ),
        ),
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
