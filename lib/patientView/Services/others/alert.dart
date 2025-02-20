import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/patientView/Services/others/mainColor.dart';
import 'package:hospital_app_frontend/patientView/Services/others/screenSize.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

showAlertDialog(BuildContext context, String x) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          title: const Icon(Icons.warning),
          content: SizedBox(
            height: (x.length < 50)
                ? heightScr(context) * 0.06
                : heightScr(context) * 0.09,
            width: widthScr(context) * 0.9,
            child: Center(
                child: Text(
              x,
              style: TextStyle(
                color: const Color.fromARGB(255, 79, 69, 68),
              ),
            )),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: greyColor(),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  height: heightScr(context) * 0.04,
                  width: widthScr(context) * 0.3,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Ok',
                        style: TextStyle(
                            color: mainColor(),
                            fontWeight: FontWeight.w700,
                            fontSize: 15),
                      )),
                ),
              ),
            )
          ],
        );
      });
}

showAlertLoading(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            content: SizedBox(
                height: heightScr(context) * 0.1,
                width: widthScr(context) * 0.5,
                child: Center(
                  child: LoadingAnimationWidget.flickr(
                    leftDotColor: greyColor(),
                    rightDotColor: mainColor(),
                    size: 50,
                  ),
                )));
      });
}
