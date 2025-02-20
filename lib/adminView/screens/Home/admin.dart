import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/accountantView/Screens/Home/accountantHome.dart';
import 'package:hospital_app_frontend/adminView/screens/adminHome.dart';
import 'package:hospital_app_frontend/patientView/Screens/profile/profileHome.dart';
import 'package:hospital_app_frontend/patientView/Services/Auth/isJwtExpired.dart';
import 'package:hospital_app_frontend/patientView/Services/others/mainColor.dart';
import 'package:hospital_app_frontend/patientView/Services/others/screenSize.dart';

class admin extends StatefulWidget {
  const admin({super.key});

  @override
  State<admin> createState() => _adminState();
}

class _adminState extends State<admin> with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    isJwtExpired(context);
  }

  List navBarPages = [adminHome(), profileHome()];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
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
