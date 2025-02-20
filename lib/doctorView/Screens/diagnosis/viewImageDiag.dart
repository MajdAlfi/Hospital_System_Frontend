import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/patientView/Services/others/mainColor.dart';
import 'package:hospital_app_frontend/patientView/Services/others/screenSize.dart';

class viewImageDiag extends StatelessWidget {
  viewImageDiag({super.key, required this.imgUrl});
  String imgUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 80.0, left: widthScr(context) * 0.1),
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
              Padding(
                padding:
                    EdgeInsets.only(top: 80.0, left: widthScr(context) * 0.1),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'IMAGE VIEWER',
                    style: TextStyle(
                        color: mainColor(),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: InteractiveViewer(
                panEnabled: true, // Allow panning.
                boundaryMargin: const EdgeInsets.all(20),
                minScale: 0.5, // Minimum zoom scale.
                maxScale: 50.0, // Maximum zoom scale.
                child: Image.network(
                  imgUrl,
                  height: heightScr(context) * 0.8,
                  width: widthScr(context) * 0.9,
                ),
              ))
        ],
      ),
    );
  }
}
