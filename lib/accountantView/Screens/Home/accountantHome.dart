import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/accountantView/Screens/Payments/patientPayments.dart';
import 'package:hospital_app_frontend/doctorView/Screens/Patient/widgets/searchWidget.dart';
import 'package:hospital_app_frontend/doctorView/Services/UserServices/getPatientData.dart';
import 'package:hospital_app_frontend/patientView/Services/others/mainColor.dart';
import 'package:hospital_app_frontend/patientView/Services/others/screenSize.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class accountantHome extends StatefulWidget {
  accountantHome({super.key});
  final searchWord = TextEditingController();
  @override
  State<accountantHome> createState() => _accountantHomeState();
}

class _accountantHomeState extends State<accountantHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: heightScr(context) * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: heightScr(context) * 0.06,
                  width: widthScr(context) * 0.7,
                  child: TextField(
                    style: const TextStyle(
                      color: Color.fromARGB(255, 79, 69, 68),
                    ),
                    controller: widget.searchWord,
                    decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide:
                              BorderSide(width: 0, style: BorderStyle.none),
                        ),
                        hintText: 'Patient Name',
                        hintStyle: TextStyle(fontSize: 30)),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.search,
                      color: mainColor(),
                      size: 25,
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
                future: getPatientData(widget.searchWord.text, context),
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
                            child: (snapshot.data.length == 0)
                                ? const Center(
                                    child: Text('No Patient in that name'))
                                : ListView.separated(
                                    itemBuilder: (context, index) =>
                                        GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          patientPayments(
                                                              pID: snapshot
                                                                          .data[
                                                                      index]
                                                                  ['_id'])));
                                            },
                                            child: SearchWidget(
                                              pName: snapshot.data[index]
                                                  ['Name'],
                                              phoneNum: snapshot.data[index]
                                                  ['phoneNum'],
                                            )),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      height: 10,
                                    ),
                                    itemCount: snapshot.data.length,
                                  ),
                          ))
                      : const Center(child: Text('No Patient in that name'));
                })
          ],
        ),
      ),
    );
  }
}
