import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/doctorView/Services/DiagnosisServices/createDiagnosisService.dart';
import 'package:hospital_app_frontend/patientView/Services/others/dataProvider.dart';
import 'package:hospital_app_frontend/patientView/Services/others/getRandString.dart';
import 'package:hospital_app_frontend/patientView/Services/others/mainColor.dart';
import 'package:hospital_app_frontend/patientView/Services/others/screenSize.dart';
import 'package:hospital_app_frontend/patientView/Screens/profile/profileHome.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class createDiagnosis extends StatefulWidget {
  createDiagnosis({super.key});

  @override
  State<createDiagnosis> createState() => _createDiagnosisState();
}

class _createDiagnosisState extends State<createDiagnosis> {
  CroppedFile? croppedImage1;
  bool isSign = false;
  final disease = TextEditingController();
  final diagnosis = TextEditingController();
  final conditions = TextEditingController();
  String fileName = '';
  var base64Image = '';

  var Items = [
    "Select Clasification",
    "X-Ray",
    "CT-Scan",
    "MRI",
  ].map<DropdownMenuItem<String>>((String limitX) {
    return DropdownMenuItem(
        value: limitX,
        child: Text(
          limitX,
          style: const TextStyle(color: Colors.black),
        ));
  }).toList();
  var Defaultx = "Select Clasification";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: widthScr(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 20),
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
              GestureDetector(
                onTap: () async {
                  try {
                    ImagePicker _Picker = ImagePicker();
                    final pickedFile = await _Picker.pickImage(
                      source: ImageSource.gallery,
                      maxHeight: 1800,
                      maxWidth: 1800,
                    );

                    if (pickedFile != null) {
                      croppedImage1 = await ImageCropper.platform.cropImage(
                        sourcePath: pickedFile.path,
                        maxWidth: 1080,
                        maxHeight: 1080,
                        aspectRatio:
                            const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
                      );

                      File upFile;
                      if (croppedImage1 != null) {
                        upFile = File(croppedImage1!.path);

                        base64Image = base64Encode(upFile.readAsBytesSync());
                        fileName =
                            getRandString(20) + upFile.path.split('/').last;
                      }
                      print(base64Image);
                      if (croppedImage1 != null) {
                        setState(() {});
                      }
                    }
                  } catch (error) {
                    print("error: $error");
                  }
                },
                child: Container(
                  height: heightScr(context) * 0.2,
                  width: heightScr(context) * 0.2,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(123, 158, 158, 158),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: (fileName.isEmpty)
                      ? const Icon(
                          Icons.add,
                          size: 45,
                          color: Color.fromARGB(255, 67, 67, 67),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: Image.asset(
                            croppedImage1!.path,
                            height: heightScr(context) * 0.2,
                            width: heightScr(context) * 0.2,
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: heightScr(context) * 0.01,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'selectPatientForDiagnosis');
                },
                child: Container(
                  height: heightScr(context) * 0.06,
                  width: widthScr(context) * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      color: greyColor()),
                  child: Center(
                    child: Text(
                      (context.watch<dataProvider>().selectedPatientID.isEmpty)
                          ? 'Select Patient'.toUpperCase()
                          : 'Patient Selected'.toUpperCase(),
                      style: TextStyle(
                          color: mainColor(),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: widthScr(context) * 0.9,
                  height: heightScr(context) * 0.06,
                  decoration: BoxDecoration(
                      color: greyColor(),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          isExpanded: true,
                          icon: const Icon(Icons.arrow_drop_down_rounded),
                          iconEnabledColor: Colors.black,
                          items: Items,
                          hint: const Text("Select Clasification"),
                          value: Defaultx,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          dropdownColor: Colors.white,
                          onChanged: (String? newValue) {
                            setState(() {
                              Defaultx = newValue!;
                            });
                          }),
                    ),
                  )),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: heightScr(context) * 0.06,
                  width: widthScr(context) * 0.9,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    controller: disease,
                    decoration: InputDecoration(
                        fillColor: greyColor(),
                        filled: true,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide:
                              BorderSide(width: 0, style: BorderStyle.none),
                        ),
                        hintText: 'Disease',
                        hintStyle: const TextStyle(fontSize: 20)),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: greyColor()),
                  height: heightScr(context) * 0.2,
                  width: widthScr(context) * 0.9,
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    controller: diagnosis,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        fillColor: greyColor(),
                        filled: true,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide:
                              BorderSide(width: 0, style: BorderStyle.none),
                        ),
                        hintText: 'Diagnosis',
                        hintStyle: const TextStyle(fontSize: 20)),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: heightScr(context) * 0.06,
                  width: widthScr(context) * 0.9,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    controller: conditions,
                    decoration: InputDecoration(
                        fillColor: greyColor(),
                        filled: true,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide:
                              BorderSide(width: 0, style: BorderStyle.none),
                        ),
                        hintText: 'Conditions',
                        hintStyle: const TextStyle(fontSize: 20)),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Doctor\'s Signiture',
                style: TextStyle(
                    color: mainColor(),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                GestureDetector(
                  onTap: () {
                    isSign = false;
                    setState(() {});
                  },
                  child: Container(
                    height: heightScr(context) * 0.06,
                    width: widthScr(context) * 0.45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30)),
                        color: (isSign == true) ? greyColor() : mainColor()),
                    child: Center(
                      child: Text(
                        'Cancel Signiture',
                        style: TextStyle(
                            color:
                                (isSign == true) ? Colors.black : Colors.white,
                            fontWeight: (isSign == true)
                                ? FontWeight.normal
                                : FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    isSign = true;
                    setState(() {});
                  },
                  child: Container(
                    height: heightScr(context) * 0.06,
                    width: widthScr(context) * 0.45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        color: (isSign == false) ? greyColor() : mainColor()),
                    child: Center(
                      child: Text(
                        'Confirm Signiture',
                        style: TextStyle(
                            color:
                                (isSign == false) ? Colors.black : Colors.white,
                            fontSize: 15,
                            fontWeight: (isSign == false)
                                ? FontWeight.normal
                                : FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ]),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    color: mainColor()),
                height: heightScr(context) * 0.06,
                width: widthScr(context) * 0.9,
                child: Center(
                  child: TextButton(
                    onPressed: () async {
                      await createDiagnosisService(
                              context,
                              context
                                  .read<dataProvider>()
                                  .userdata
                                  .id
                                  .toString(),
                              fileName,
                              base64Image,
                              context.read<dataProvider>().selectedPatientID,
                              Defaultx,
                              disease.text,
                              diagnosis.text,
                              conditions.text,
                              isSign)
                          .then((value) {
                        if (value == 200) {
                          Provider.of<dataProvider>(context, listen: false)
                              .changeSelectedPatientID('');
                          conditions.text = '';
                          base64Image = '';
                          fileName = '';
                          diagnosis.text = '';
                          disease.text = '';
                          isSign = false;
                          Defaultx = "Select Clasification";

                          setState(() {});
                        }
                      });
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
