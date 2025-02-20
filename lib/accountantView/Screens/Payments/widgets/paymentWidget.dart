import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/accountantView/Services/isPaidService.dart';
import 'package:hospital_app_frontend/main.dart';
import 'package:hospital_app_frontend/patientView/Services/others/dataProvider.dart';
import 'package:hospital_app_frontend/patientView/Services/others/mainColor.dart';
import 'package:hospital_app_frontend/patientView/Services/others/screenSize.dart';
import 'package:provider/provider.dart';

class paymentWidget extends StatelessWidget {
  paymentWidget(
      {super.key,
      required this.amount,
      required this.date,
      required this.isPaid,
      required this.desc,
      required this.fID,
      required this.pID});
  int amount;
  bool isPaid;
  DateTime date;
  String desc;
  String fID;
  String pID;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightScr(context) * 0.3,
      width: widthScr(context) * 0.9,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          color: greyColor()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$amount£',
            style: TextStyle(
              color: mainColor(),
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            '${date.year}-${date.month}-${date.day}',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            (isPaid == false) ? 'Not Paid' : 'Paid',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: (isPaid == false) ? Colors.red : Colors.green),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '$desc',
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black45,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          if (isPaid == false &&
              context.read<dataProvider>().userdata.accountType == 'accountant')
            Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  color: mainColor()),
              width: widthScr(context) * 0.8,
              height: heightScr(context) * 0.06,
              child: TextButton(
                  onPressed: () {
                    isPaidService(context, fID, pID, desc);
                  },
                  child: const Text(
                    'Paid',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
            )
        ],
      ),
    );
  }
}
