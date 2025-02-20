import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/adminView/Services/deleteUser.dart';
import 'package:hospital_app_frontend/patientView/Services/others/mainColor.dart';
import 'package:hospital_app_frontend/patientView/Services/others/screenSize.dart';

class adminHomeWidget extends StatefulWidget {
  adminHomeWidget(
      {super.key,
      required this.indexSelected,
      required this.pID,
      required this.name,
      required this.phoneNum});
  int indexSelected;
  String pID;
  String name;
  String phoneNum;
  @override
  State<adminHomeWidget> createState() => _adminHomeWidgetState();
}

class _adminHomeWidgetState extends State<adminHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
          color: greyColor()),
      height: heightScr(context) * 0.3,
      width: widthScr(context) * 0.9,
      child: Column(
        children: [
          SizedBox(
            height: heightScr(context) * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      widget.phoneNum,
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              IconButton(
                  onPressed: () async {
                    await deleteUser(context, widget.pID);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 30,
                  )),
            ],
          ),
          SizedBox(
            height: heightScr(context) * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color:
                      (widget.indexSelected == 0) ? mainColor() : greyColor(),
                ),
                height: heightScr(context) * 0.05,
                width: widthScr(context) * 0.15,
                child: TextButton(
                    onPressed: () {
                      widget.indexSelected = 0;
                      setState(() {});
                    },
                    child: Text(
                      'Patient',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: (widget.indexSelected == 0)
                              ? Colors.white
                              : Colors.black),
                    )),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color:
                      (widget.indexSelected == 1) ? mainColor() : greyColor(),
                ),
                height: heightScr(context) * 0.05,
                width: widthScr(context) * 0.15,
                child: TextButton(
                    onPressed: () {
                      widget.indexSelected = 1;
                      setState(() {});
                    },
                    child: Text(
                      'Doctor',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: (widget.indexSelected == 1)
                              ? Colors.white
                              : Colors.black),
                    )),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color:
                      (widget.indexSelected == 2) ? mainColor() : greyColor(),
                ),
                height: heightScr(context) * 0.05,
                width: widthScr(context) * 0.2,
                child: TextButton(
                    onPressed: () {
                      widget.indexSelected = 2;
                      setState(() {});
                    },
                    child: Text(
                      'accountant',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: (widget.indexSelected == 2)
                              ? Colors.white
                              : Colors.black),
                    )),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color:
                      (widget.indexSelected == 3) ? mainColor() : greyColor(),
                ),
                height: heightScr(context) * 0.05,
                width: widthScr(context) * 0.15,
                child: TextButton(
                    onPressed: () {
                      widget.indexSelected = 3;
                      setState(() {});
                    },
                    child: Text(
                      'admin',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: (widget.indexSelected == 3)
                              ? Colors.white
                              : Colors.black),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
