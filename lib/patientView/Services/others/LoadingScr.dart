import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hospital_app_frontend/patientView/Services/Auth/getToken.dart';
import 'package:hospital_app_frontend/patientView/Services/Auth/refreshToken.dart';
import 'package:hospital_app_frontend/patientView/Services/others/alert.dart';
import 'package:hospital_app_frontend/patientView/Services/others/mainColor.dart';
import 'package:hospital_app_frontend/patientView/Services/others/screenSize.dart';
import 'package:hospital_app_frontend/patientView/Screens/Auth/Welcome.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loadingScr extends StatefulWidget {
  const loadingScr({super.key});

  @override
  State<loadingScr> createState() => _loadingScrState();
}

late Widget Home;
bool isLoading = true;

class _loadingScrState extends State<loadingScr> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    funcLoading();
  }

  Future<void> funcLoading() async {
    final prefs = await SharedPreferences.getInstance();
    final pass = prefs.getString('Password');
    final userToken = prefs.getString('userToken');
    Map<String, dynamic> tokenDecode = JwtDecoder.decode(userToken!);
    await reefreshToken(tokenDecode['Email'], pass!, context)
        .then((value) async {
      if (value == true) {
        await getToken(context);
        if (tokenDecode['accountType'] == 'Patient') {
          Navigator.pushReplacementNamed(context, 'homePatient');
        } else if (tokenDecode['accountType'] == 'Doctor') {
          Navigator.pushReplacementNamed(context, 'doctorHome');
        } else if (tokenDecode['accountType'] == 'accountant') {
          Navigator.pushReplacementNamed(context, 'accountantView');
        } else if (tokenDecode['accountType'] == 'admin') {
          Navigator.pushReplacementNamed(context, 'adminView');
        } else {
          showAlertDialog(context, 'Account Type invalid');
        }
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => welcomePage()));
        showAlertDialog(context, 'An error Occureed');

        print(tokenDecode['accountType']);
        final newuserToken = prefs.getString('userToken');
        print(tokenDecode);
        print(newuserToken);
        isLoading = false;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: (isLoading == true)
            ? SizedBox(
                width: widthScr(context) * 0.2,
                height: widthScr(context) * 0.2,
                child: LoadingAnimationWidget.flickr(
                  leftDotColor: greyColor(),
                  rightDotColor: mainColor(),
                  size: 50,
                ),
              )
            : Home,
      ),
    );
  }
}
