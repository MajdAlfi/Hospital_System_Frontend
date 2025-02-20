import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/doctorView/Screens/Report/listOfReports.dart';
import 'package:hospital_app_frontend/patientView/Services/Auth/isJwtExpired.dart';
import 'package:hospital_app_frontend/patientView/Services/others/dataProvider.dart';
import 'package:hospital_app_frontend/patientView/Services/others/mainColor.dart';
import 'package:hospital_app_frontend/patientView/Services/others/screenSize.dart';
import 'package:hospital_app_frontend/patientView/Screens/Financial/financialHome.dart';
import 'package:hospital_app_frontend/patientView/Screens/Home/homePagePatient.dart';
import 'package:hospital_app_frontend/patientView/Screens/Report/reportHome.dart';
import 'package:hospital_app_frontend/patientView/Screens/profile/profileHome.dart';
import 'package:provider/provider.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class homePatient extends StatefulWidget {
  homePatient({super.key});

  @override
  State<homePatient> createState() => _homePatientState();
}

class _homePatientState extends State<homePatient>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    isJwtExpired(context);
  }

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List navBarPages = [
      homePagePatient(),
      listOfReports(
        patientID: context.read<dataProvider>().userdata.id.toString(),
      ),
      FinancialHome(),
      profileHome()
    ];
    return Scaffold(
        body: navBarPages.elementAt(_selectedIndex),
        bottomNavigationBar: FlashyTabBar(
          backgroundColor: Colors.white,
          animationCurve: Curves.linear,
          selectedIndex: _selectedIndex,
          height: heightScr(context) * 0.06,
          iconSize: 30,
          showElevation: false, // use this to remove appBar's elevation
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
          }),
          items: [
            FlashyTabBarItem(
                icon: const Icon(Icons.dashboard),
                title: Text('Home'),
                activeColor: mainColor(),
                inactiveColor: Colors.black38),
            FlashyTabBarItem(
                icon: const Icon(Icons.document_scanner),
                title: Text('Reports'),
                activeColor: mainColor(),
                inactiveColor: Colors.black38),
            FlashyTabBarItem(
                icon: const Icon(Icons.money),
                title: Text('Financial'),
                activeColor: mainColor(),
                inactiveColor: Colors.black38),
            FlashyTabBarItem(
                icon: const Icon(Icons.person),
                title: Text('Profile'),
                activeColor: mainColor(),
                inactiveColor: Colors.black38),
          ],

// icon size:24 for fontAwesomeIcons
// icons size: 30 for MaterialIcons
        ));
  }
}
