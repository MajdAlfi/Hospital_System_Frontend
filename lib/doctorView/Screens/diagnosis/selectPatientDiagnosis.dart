// import 'package:flutter/material.dart';
// import 'package:hospital_app_frontend/doctorView/Screens/Patient/widgets/searchWidget.dart';
// import 'package:hospital_app_frontend/doctorView/Screens/diagnosis/listOfDiagnosis.dart';
// import 'package:hospital_app_frontend/patientView/Services/others/mainColor.dart';
// import 'package:hospital_app_frontend/patientView/Services/others/screenSize.dart';

// class selectPatientDiagnosis extends StatelessWidget {
//   const selectPatientDiagnosis({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final searchWord = TextEditingController();
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 80.0, left: 20),
//             child: Align(
//               alignment: Alignment.topLeft,
//               child: IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: Icon(
//                     Icons.arrow_back_ios,
//                     size: 25,
//                     color: mainColor(),
//                   )),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               SizedBox(
//                 height: heightScr(context) * 0.06,
//                 width: widthScr(context) * 0.7,
//                 child: TextField(
//                   style: const TextStyle(
//                     color: Color.fromARGB(255, 79, 69, 68),
//                   ),
//                   controller: searchWord,
//                   decoration: const InputDecoration(
//                       fillColor: Colors.white,
//                       filled: true,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(20)),
//                         borderSide:
//                             BorderSide(width: 0, style: BorderStyle.none),
//                       ),
//                       hintText: 'Patient Name',
//                       hintStyle: TextStyle(fontSize: 30)),
//                 ),
//               ),
//               IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.search,
//                     color: mainColor(),
//                     size: 25,
//                   ))
//             ],
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Align(
//               alignment: Alignment.bottomCenter,
//               child: SizedBox(
//                 height: heightScr(context) * 0.7,
//                 width: widthScr(context) * 0.9,
//                 child: ListView.separated(
//                   itemBuilder: (context, index) => GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => listOfDiagnosis(
//                                       patientID: '',
//                                     )));
//                       },
//                       child: SearchWidget(
//                         pName: '',
//                         phoneNum: 0,
//                       )),
//                   separatorBuilder: (context, index) => const SizedBox(
//                     height: 10,
//                   ),
//                   itemCount: 10,
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
// }
